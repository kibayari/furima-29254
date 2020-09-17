FactoryBot.define do
  factory :user do
    nickname              {"テスト"}
    email                 {"kkk@gmail.com"}
    password              {"123asd"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
  end
end




     
