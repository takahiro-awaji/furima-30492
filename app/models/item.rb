class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :name,   presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :item_status_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_area_id, presence: true, numericality: { other_than: 0, message: 'Select' }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :price, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image
end
