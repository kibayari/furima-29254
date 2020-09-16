class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 空で投稿出来ないように追記
  validates :nickname, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :email, presence: true

  # ニックネーム漢字およびカタカナでしか入力させない（配布のエラーメッセージで対応？
  # with_options presence: true, format: { with: /\A[ぁ-ん一-龥]+\z/, message: '全角文字を使用してください' } do
    # validates :nickname
  # end
end