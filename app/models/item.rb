class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  #ジャンルの選択が「--」の時は保存できないようにする
  belongs_to_active_hash :genre
  belongs_to_active_hash :comdition
  belongs_to_active_hash :delivery
  belongs_to_active_hash :shipping
  belongs_to_active_hash :deliberyday


  with_options presence: true do
    validates :name, length: { maximum: 40 } 
    validates :item_info, length: { maximum: 1000 } 
    validates :genre_id, :comdition_id, :delivery_id, :shipping_id, :deliberyday_id, numericality: { other_than: 1 } # 空で投稿出来ないように追記
    validates :image     # 空で投稿出来ないように追記
    validates :price, format: { with: /\A[0-9]+\z/ } ,numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }  #全て半角数字、且つ¥300~¥9.999.999-まで。
  end
end