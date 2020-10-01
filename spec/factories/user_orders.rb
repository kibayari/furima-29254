FactoryBot.define do
  factory :user_orders do
    association :user
    association :item
    token            {"token"}
    post_codo        {"123-1234"} 
    shipping_id      {"1"} 
    city             {"テスト市"}
    addresses        {"テスト町"}
    building         {"ビル"}
    phone           {"09099990000"}
  end
end
