FactoryBot.define do
  factory :user do
    nickname              { 'ルフィ' }
    email                 { 'luffy@onepiece.com' }
    password              { 'onepiece084' }
    password_confirmation { 'onepiece084' }
    first_name            { '太郎' }
    last_name             { '林' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ハヤシ' }
    birthday              { '2000-01-01' }
  end
end
