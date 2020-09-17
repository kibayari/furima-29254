FactoryBot.define do
  factory :user do
    nickname              {"テスト"}
    email                 {"kkk@gmail.com"}
    password              {"123abc"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_date            {"1930-10-10"}
  end
end




     
