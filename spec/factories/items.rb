FactoryBot.define do
  factory :item do
    name             {"テストタイトル"} 
    item_info        {"商品状態テスト ABC abc 123 １２３"} 
    genre_id         {"2"}
    comdition_id     {"2"}
    delivery_id      {"2"}
    shipping_id      {"2"}
    deliberyday_id   {"2"}
    price            {"500"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

