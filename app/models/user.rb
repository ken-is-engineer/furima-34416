class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, allow_blank: true
    validates :nickname
    validates :email, allow_blank: true
    validates :first_name 
    validates :last_name 
    validates :first_kana
    validates :last_kana
    validates :birthday
  end

  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, allow_blank: true

  validates :password, format: {with: /[a-z\d]{6,}/i}, allow_blank: true

  with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}, allow_blank: true do
    validates :first_name
    validates :last_name 
  end
  
  with_options format: {with: /\A[ァ-ヶー－]+\z/}, allow_blank: true do
    validates :first_kana
    validates :last_kana
  end

end
