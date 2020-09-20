class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, :comdition, :delivery, :shipping, :deliberyday
  

  #空の投稿を保存できないようにする
  validates :title, :text, :genre, :comdition_id, :delivery_id, :shipping, :deliberyday, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :comdition_id, :delivery_id, :shipping, :deliberyday, numericality: { other_than: 1 } 
end
