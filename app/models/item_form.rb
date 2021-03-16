class ItemForm

  include ActiveModel::Model
  attr_accessor :image, :title, :detail, :price, :status_id, :fee_id, :from_id, :days_id, :category_id, :user_id, :name

  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :price
    validates :name
    validates :user_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, allow_blank: true
  validates :name, format: {with: /\A[a-z]+\z/}, allow_blank: true

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :fee_id
    validates :from_id
    validates :days_id
    validates :category_id
  end

  def save
    item = Item.create(user_id: user_id, image: image, title: title, detail: detail, price: price, status_id: status_id, fee_id: fee_id, from_id: from_id, days_id: days_id, category_id: category_id)
    tag = Tag.where(name: name).first_or_initialize #すでに同名タグが存在していたら、新規作成しない、という動作をしてくれるメソッド。
    tag.save

    ItemTag.create(item_id: item.id, tag_id: tag.id)
  end

end