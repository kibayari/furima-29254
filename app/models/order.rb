class Order < ApplicationRecord
  validates :price, presence: true

  has_one :address, dependent: :destroy
  belongs_to :user
  belongs_to :item


  extend ActiveHash::Associations::ActiveRecordExtensions
  #ジャンルの選択が「--」の時は保存できないようにする
  belongs_to_active_hash :shipping




end
