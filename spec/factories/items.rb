FactoryBot.define do
  factory :item do
    name                 { 'the_north_face' }
    item_description     { 'これはテストです！' }
    category_id          { '2' }
    item_status_id       { '3' }
    shipping_charge_id   { '2' }
    shipping_area_id     { '3' }
    days_to_ship_id      { '2' }
    price                { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
