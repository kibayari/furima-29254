FactoryBot.define do
  factory :item do
    name             {"テストタイトル"} 
    item_info        {"商品状態テスト"} 
    category_id      {"2"}
    status_id        {"2"}
    delivery_fee_id  {"2"}
    shipping_area_id {"2"}
    delivery_day_id  {"2"}
    price            {"500"}
  end
end