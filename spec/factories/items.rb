FactoryBot.define do
  factory :item do
    id                {rand(1..100)}
    title             {Faker::JapaneseMedia::DragonBall.character}
    detail            {Faker::JapaneseMedia::DragonBall.race}
    price             {rand(300..9999999)}
    status_id         {rand(2..8)}
    from_id           {rand(2..10)}
    fee_id            {rand(2..3)}
    days_id           {rand(2..4)}
    category_id       {rand(2..11)}

    association :user

    after(:build) do |item| #buildした後に行われる処理を指定。
      item.image.attach(io: File.open('public/images/image1.png'), filename: 'image1.png')
    end
  end
end
