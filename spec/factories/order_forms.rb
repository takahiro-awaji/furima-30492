FactoryBot.define do
  factory :order_form do
    user_id          { 1 }
    item_id          { 1 }
    postal_code      { '123-4567' }
    prefecture_id    { 29 }
    city             { '所沢市北' }
    house_number     { '1-1' }
    building_name    { 'マンションん' }
    phone_number     { '09012345678' }
    order_id         { 1 }
    token            { 'cardinfo' }
  end
end
