require 'rails_helper'

RSpec.describe UserOrders, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @user_orders = FactoryBot.build(:user_orders, item_id: @item.id, user_id: @user.id)
  end
  
  describe '購入者情報の保存' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_orders).to be_valid
    end

    it 'post_codoが空だと保存できないこと' do
      @user_orders.post_codo = nil
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Post codo is invalid")
    end

    it 'post_codoが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_orders.post_codo = '1234567'
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Post codo is invalid")
    end
  
    it 'cityが空だと保存できないこと' do
      @user_orders.city = nil
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空だと保存できないこと' do
      @user_orders.addresses = nil
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Addresses can't be blank")
    end
  
    it "phoneが11桁以内でないと登録できないこと " do
      @user_orders.phone = Faker::Lorem.characters(number:12)
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end

    it 'phoneが半角のハイフンを含んでいると保存ができないこと' do
      @user_orders.phone = '090-0009999'
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Phone is invalid")
    end

    it 'buildingは空でも保存できること' do
      @user_orders.building = ""
      expect(@user_orders).to be_valid
    end

    it 'tokenがない場合、購入できない' do
      @user_orders.token = nil
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Token can't be blank")
    end
  end
end