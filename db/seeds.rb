# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
50.times do 
    Book.create(
      title: Faker::Book.title,
      author: Faker::Book.author,
      image_url: Faker::Avatar.image,
      genre: Faker::Book.genre,
      publisher: Faker::Book.publisher,
      year: Faker::Date.birthday(min_age: 1, max_age: 95).year.to_s
    )
end
UserAdmin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?