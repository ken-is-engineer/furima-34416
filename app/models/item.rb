class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :detail
    validates :status_id
    validates :fee_id 
    validates :from_id 
    validates :days_id
    validates :category_id
    validates :price
    validates :user
  end

  belongs_to :user
end
