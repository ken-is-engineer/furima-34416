FactoryBot.define do
  factory :form do
    post_code   {'000-0000'}
    prefecture_id {rand(2..10)}
    city          {Faker::Address.city}
    address_line  {Faker::Address.street_address}
    building      {Faker::Address.secondary_address}
    phone_number  {rand(10000000000..99999999999)}
    user_id       {1}
    item_id       {1}
    token         {'tok_abcdefghijk00000000000000000'}
  end
end
