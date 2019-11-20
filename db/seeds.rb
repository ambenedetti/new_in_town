# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting everything...'
puts '------------------'

User.destroy_all
Question.destroy_all
Tip.destroy_all
Reason.destroy_all
Category.destroy_all
UserCity.destroy_all

puts 'Creating reasons'
puts '------------------'

reasons = ["Discriminatory", "Vulgar and/or offensive", "Advertisement", "Not true"]

reasons.each do |reason|
  ex = Reason.create!(name: reason)
  puts "- #{ex.name}"
end

puts 'Creating categories'
puts '------------------'

categories = ["Sex & relationships", "Transportation", "Food", "Night life", "Work", "Sports", "Culture", "Pets", "Utilities", "Children"]

categories.each do |category|
  cat = Category.create!(name: category)
  puts "- #{cat.name}"
end


if Rails.env.development?
  puts 'Creating a user1'
  puts '------------------'

  user1 = User.create!(email: "barney@stinson.org", password: "password", first_name: "Barney", last_name: "Stinson", username: "The Barnacle")

  puts 'Adding 15 fake tips for Barney in Madrid...'

  15.times do
    tip = Tip.create!(
      title: Faker::TvShows::Friends.character,
      content: Faker::TvShows::Friends.quote,
      city: "Madrid",
      longitude: -3.703790,
      latitude: 40.416775,
      status: 0,
      user: user1,
      category: Category.all.sample
    )

    puts "+ #{tip.title}"
  end

  puts 'Adding 10 fake questions for Barney...'

  10.times do
    question = Question.create!(
      title: Faker::TvShows::HowIMetYourMother.catch_phrase,
      city: "Paris",
      status: 0,
      category: Category.all.sample,
      user: user1
    )

    puts "? #{question.title}"
  end


  puts 'Adding 15 fake tips for Barney in Paris...'

  15.times do
    tip = Tip.create!(
      title: Faker::TvShows::ParksAndRec.character,
      content: Faker::TvShows::HowIMetYourMother.quote,
      city: "Paris",
      longitude: 2.349014,
      latitude: 48.864716,
      status: 0,
      user: user1,
      category: Category.all.sample
    )

    puts "+ #{tip.title}"
  end

  puts 'Creating user2'
  puts '------------------'

  user2 = User.create!(email: "ted@mosby.org", password: "password", first_name: "Ted", last_name: "Mosby", username: "The sexless in-keeper")

  puts 'Adding 30 fake tips for Ted in Paris...'

  30.times do
    tip = Tip.create!(
      title: Faker::TvShows::ParksAndRec.character,
      content: Faker::TvShows::HowIMetYourMother.quote,
      city: "Paris",
      longitude: 2.349014,
      latitude: 48.864716,
      status: 0,
      user: user2,
      category: Category.all.sample
    )

    puts "+ #{tip.title}"
  end

  puts 'Creating 10 fake questions for Ted...'

  10.times do
    question = Question.create!(
      title: Faker::TvShows::HowIMetYourMother.catch_phrase,
      city: "Madrid",
      status: 0,
      category: Category.all.sample,
      user: user2
    )

    puts "? #{question.title}"
  end

  puts 'Creating 3 User cities'
  puts '------------------'

  city_madrid = UserCity.create!(user_id: 1, name: 'Madrid')
  city_paris = UserCity.create!(user_id: 1, name: 'Paris')
  city_london = UserCity.create!(user_id: 2, name: 'London')

  puts "> #{city_madrid.name}"
  puts "> #{city_london.name}"
  puts "> #{city_paris.name}"


  puts "Finished seeding!!!"
end
