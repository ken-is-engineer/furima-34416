class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :item_id
    validates :user_id
  end
end
