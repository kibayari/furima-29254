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
      @item.category_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank") 
    end

    it "カテゴリーの選択が「--」の場合は登録できないこと" do
      @item.category_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1") 
    end

    it "商品の状態の選択がない場合は登録できないこと" do
      @item.status_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank") 
    end

    it "商品の状態の選択が「--」の場合は登録できないこと" do
      @item.status_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1") 
    end

    it "発送料の負担の選択がない場合は登録できないこと" do
      @item.delivery_fee_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank") 
    end

    it "発送料の選択が「--」の場合は登録できないこと" do
      @item.delivery_fee_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1") 
    end

    it "発送元の地域の選択がない場合は登録できないこと" do
      @item.shipping_area_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank") 
    end

    it "発送元の選択が「--」の場合は登録できないこと" do
      @item.shipping_area_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1") 
    end

    it "発送までの日数の選択がない場合は登録できないこと" do
      @item.delivery_day_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank") 
    end

    it "発送の選択が「--」の場合は登録できないこと" do
      @item.delivery_day_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1") 
    end

    it "価格の入力がない場合は登録できないこと" do
      @item.price = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank") 
    end
    
    it "item_infoが1000文字以上であれば登録できないこと " do
      @item.item_info = "1001"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info is invalid")      
    end

    it "nameが40文字以上であれば登録できないこと " do
      @item.name = "41" 
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is invalid")
    end

    it "値段が300以下であれば登録できないこと " do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

    it "値段が半角英数以外だと登録できないこと " do
      @item.price = "８００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "値段が¥9,999,999以上だと登録できないこと " do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end