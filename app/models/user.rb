class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }, presence: true
  validates :last_name_read, :first_name_read, format: { with: /\A[ァ-ヶ]+\z/ }, presence: true
end
