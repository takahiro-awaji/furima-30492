class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  with_options presence: true do
    validates :name
    validates :item_description
    validates :image
    validates :price,
      format: { with: /\A[0-9]+\z/ },
      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :days_to_ship_id
      validates :item_status_id
      validates :shipping_charge_id
    end
    validates :shipping_area_id,
            numericality: { other_than: 0, message: 'Select' }
  end
  belongs_to :user
  has_one_attached :image
end
