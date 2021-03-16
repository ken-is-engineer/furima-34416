class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_one    :purchase
  has_many   :favorites
  has_many :item_tag, dependent: :destroy
  has_many :tags, through: :item_tag

  #impressionaitの機能を使うための記述
  is_impressionable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :fee
  belongs_to :from
  belongs_to :days
  belongs_to :category
end
