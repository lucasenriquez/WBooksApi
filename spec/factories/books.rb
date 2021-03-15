FactoryBot.define do
  factory :book do
    genre        { Faker::Book.genre }
    author       { Faker::Book.author }
    image        { Faker::Avatar.image }
    title        { Faker::Book.title }
    publisher    { Faker::Book.publisher }
    year         { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end
