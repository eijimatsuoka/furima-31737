class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :password, format: {with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end