class Form
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id, :token 

  with_options presence: true do
    validates :post_code,     format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number,  format:{with: /\A[0-9]+\z/}, length: { maximum: 11 } 
    validates :user_id
    validates :item_id
    validates :token
    #validates :building は任意記入のためバリデーション不要。
    #user_id,item_idは本来アソシエーションでバリデーションも兼ねているが、formオブジェクトパターンではアソシエーションできないので追加する。
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end