require 'rails_helper'
RSpec.describe Item, type: :model do
  before do                          #bofore でFactoryBot.build(:item)をまとめて処理。
    @item = FactoryBot.build(:item)  #変数itemを@itemに置き換えている。
  end

  describe '商品登録' do
    it "全ての条件を満たしていれば登録できること" do
      expect(@item).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      @item.name = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank") 
    end 

    it "商品の説明文がない場合は登録できないこと" do
      @item.item_info = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank") 
    end

    it "カテゴリーの選択がない場合は登録できないこと" do
      @item.genre_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre can't be blank") 
    end

    it "カテゴリーの選択が「--」の場合は登録できないこと" do
      @item.genre_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre must be other than 1") 
    end

    it "商品の状態の選択がない場合は登録できないこと" do
      @item.comdition_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Comdition can't be blank") 
    end

    it "商品の状態の選択が「--」の場合は登録できないこと" do
      @item.comdition_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Comdition must be other than 1") 
    end

    it "発送料の負担の選択がない場合は登録できないこと" do
      @item.delivery_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank") 
    end

    it "発送料の選択が「--」の場合は登録できないこと" do
      @item.delivery_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery must be other than 1") 
    end

    it "発送元の地域の選択がない場合は登録できないこと" do
      @item.shipping_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank") 
    end

    it "発送元の選択が「--」の場合は登録できないこと" do
      @item.shipping_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1") 
    end

    it "発送までの日数の選択がない場合は登録できないこと" do
      @item.deliberyday_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliberyday can't be blank") 
    end

    it "発送の選択が「--」の場合は登録できないこと" do
      @item.deliberyday_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliberyday must be other than 1") 
    end

    it "価格の入力がない場合は登録できないこと" do
      @item.price = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank") 
    end
    
    it "商品情報が1000文字以上であれば登録できないこと " do
      @item.item_info = Faker::Lorem.characters(number:1001)
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info is too long (maximum is 1000 characters)")      
    end

    it "商品名が40文字以上であれば登録できないこと " do
      @item.name = Faker::Lorem.characters(number:41)
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end

    it "値段が半角英数以外だと登録できないこと " do
      @item.price = "８００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "値段が¥299以下であれば登録できないこと " do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "値段が¥9,999,999以上だと登録できないこと " do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end