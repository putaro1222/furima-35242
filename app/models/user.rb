class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 with_options presence: true do
  validates :nickname
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday
end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  has_many :items
  has_many :orders
  
end