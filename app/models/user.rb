class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :birth_date, presence: true # 空で投稿出来ないように追記
    validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }, uniqueness: true   #@を必ず含ませる、メールの一意性
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } , length: { maximum: 20 } do
      validates :nickname
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } , length: { maximum: 20 } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end