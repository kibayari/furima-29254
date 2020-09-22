class Item < ApplicationRecord

  has_one_attached :image
  has_one :purchases, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  #ジャンルの選択が「--」の時は保存できないようにする
  belongs_to_active_hash :genre
  belongs_to_active_hash :comdition
  belongs_to_active_hash :delivery
  belongs_to_active_hash :shipping
  belongs_to_active_hash :deliberyday


  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/ } , length: { maximum: 40 } 
    validates :item_info, format: { with: /\A[ぁ-んァ-ン一-龥]/ } , length: { maximum: 1000 } 
    validates :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :delivery_day_id, numericality: { other_than: 1 } # 空で投稿出来ないように追記
    validates :image     # 空で投稿出来ないように追記
    validates :price, format: { with: /\A[0-9]+\z/ } #全て半角数字
  end
end
