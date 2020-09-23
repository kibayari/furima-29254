FactoryBot.define do
  factory :item do
    name             {"テストタイトル"} 
    item_info        {"商品状態テスト ABC abc 123 １２３"} 
    category_id      {"2"}
    status_id        {"2"}
    delivery_fee_id  {"2"}
    shipping_area_id {"2"}
    delivery_day_id  {"2"}
    price            {"500"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

