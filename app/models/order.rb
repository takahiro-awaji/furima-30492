class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  with_options presence: true do
    validates :card
    validates :exp_month
    validates :exp_year
    validates :cvc
  end
end
