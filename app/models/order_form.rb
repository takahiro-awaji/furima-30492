class OrderForm
  include ActiveModel::Model

  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  validates :user, presence: true
  validates :item, presence: true
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  def save
    Order.create(user: user, item: item)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                   house_number: house_number, building_name: building_name phone_number: phone_number)
  end
end