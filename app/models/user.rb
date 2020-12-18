class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :last_name_read, :first_name_read, format: { with: /\A[ァ-ヶ]+\z/ }
end
