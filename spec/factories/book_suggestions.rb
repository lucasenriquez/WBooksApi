FactoryBot.define do
  factory :book_suggestion do
    editorial    { Faker::Company.name }
    price        { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    author       { Faker::Book.author }
    title        { Faker::Book.title }
    link         { Faker::Book.genre }
    publisher    { Faker::Book.publisher }
    year         { Faker::Number.within(range: 1..10).to_s}
    user         { create(:user) }
  end
end
