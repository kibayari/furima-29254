class Item < ApplicationRecord

  has_one_attached :image
  has_one :purchases, dependent: :destroy

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/ } , length: { maximum: 40 } 
    validates :item_info, format: { with: /\A[ぁ-んァ-ン一-龥]/ } , length: { maximum: 1000 } 
    validates :price, presence: true # 空で投稿出来ないように追記
  end
end
