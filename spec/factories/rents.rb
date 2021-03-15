FactoryBot.define do
  factory :rent do
    user { create(:user) }
    book { create(:book) }
    from { "2021-03-15 18:42:17" }
    to { "2021-03-15 18:42:17" }
  end
end
