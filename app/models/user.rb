class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: true
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\p{katakana}/
  /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\p{katakana}/
  /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true
  validates_format_of :password, :with => /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
end
