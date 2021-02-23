FactoryBot.define do
  factory :user do
    transient do
      gimei                 {Gimei.name}
    end

    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::JapaneseMedia::DragonBall.character}
    email                 {Faker::Internet.free_email}
    first_name            {gimei.first.kanji}
    last_name             {gimei.last.kanji}
    first_kana            {gimei.first.katakana}
    last_kana             {gimei.last.katakana}
    birthday              {Faker::Date.backward}
  end
end