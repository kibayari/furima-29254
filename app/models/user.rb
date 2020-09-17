class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 空で投稿出来ないように追記
  validates :birth_date, presence: true

  # ニックネーム漢字およびカタカナでしか入力させない（正規表現）
  # with_options presence: true do
    # validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    # validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  # end

  # validates :nickname, presence: true, length: { maximum: 20 }
  # validates :first_name, presence: true, length: { maximum: 20 }
  # validates :last_name, presence: true, length: { maximum: 20 }
  # validates :first_name, presence: true, length: { maximum: 20 }
  # validates :last_name, presence: true, length: { maximum: 20 }
  # validates :password, presence: true, length: { maximum: 20 }

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i },length: { maximum: 20 }
    
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