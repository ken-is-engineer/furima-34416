class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, allow_blank: true

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :fee_id
    validates :from_id
    validates :days_id
    validates :category_id
  end

  has_one_attached :image
  belongs_to :user
  has_one    :purchase

    #impressionaitの機能を使うための記述
    is_impressionable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :fee
  belongs_to :from
  belongs_to :days
  belongs_to :category
end
