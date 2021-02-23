class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}, allow_blank: true
  validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}, allow_blank: true
  validates :first_kana, format: {with: /\A[ァ-ヶー－]+\z/}, allow_blank: true
  validates :last_kana, format: {with: /\A[ァ-ヶー－]+\z/}, allow_blank: true
end
