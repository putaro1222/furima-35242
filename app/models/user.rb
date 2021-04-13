class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: ["@"] }
  validates :encrypted_password, presence: true, length: {minimum: 6 }, confirmation: true, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  has_many :items
  has_many :orders
  
end
