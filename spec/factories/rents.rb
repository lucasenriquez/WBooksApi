FactoryBot.define do
  factory :rent do
    user { create(:user) }
    book { create(:book) }
    from { Time.now }
    to   { Faker::Date.forward(days: 23) }
  end
end
