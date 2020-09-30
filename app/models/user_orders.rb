class UserOrders
  include ActiveModel::Model
  attr_accessor :post_codo, :city, :token, :shipping_id, :addresses, :building, :phone, :order_id, :user_id, :item_id 
    
  with_options presence: true do
   validates :post_codo, format: {with: /\A\d{3}[-]\d{4}\z/}
   validates :phone, format: { with: /\A[0-9]+\z/},length: { maximum: 11 } 
   validates :city,length: { maximum: 50 } 
   validates :addresses,length: { maximum: 50 }
   validates :phone,length: { maximum: 20 }
  end

  def save
    # 購入者の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_codo: post_codo, city: city, addresses: addresses, building: building, phone: phone, order_id: order.id) 
  end
end