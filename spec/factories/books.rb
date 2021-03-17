FactoryBot.define do
  factory :book do
    genre        { Faker::Book.genre }
    author       { Faker::Book.author }
    image_url    { Faker::Avatar.image }
    title        { Faker::Book.title }
    publisher    { Faker::Book.publisher }
    year         { Faker::Number.within(range: 1..10).to_s }
  end
end
