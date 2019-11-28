# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting everything...'
puts '------------------'

Reason.destroy_all
puts "deleting tips"
Tip.destroy_all
puts "deleting questions"
Question.destroy_all
puts "deleting user cities"
UserCity.destroy_all
puts "deleting users"
User.destroy_all


puts 'Creating reasons'
puts '------------------'

reasons = ["Discriminatory", "Vulgar and/or offensive", "Advertisement", "Not true"]

reasons.each do |reason|
  ex = Reason.create!(name: reason)
  puts "- #{ex.name}"
end

puts 'Creating categories'
puts '------------------'

categories = ["Culture", "Transportation", "Food", "Going out", "Work", "Sports", "Sex and relationships", "Pets", "Utilities", "Children"]
categories.each_with_index do |category, index|
  cat = Category.create!(name: category, image:"icon-#{index}.svg")
  puts "- #{cat.name}"
end




if Rails.env.development?
  puts 'Creating a user1'
  puts '------------------'

  user1 = User.create!(email: "barney@stinson.org", password: "password", first_name: "Barney", last_name: "Stinson", username: "The Barnacle")

  puts 'Adding fake tips for Barney in Madrid...'


  tip = Tip.create!(
    title: "Taking your dog in the subway (UK)",
    content: "You can take your dog in the subway, but they always have to wear a muzzle (though I’ve seen plenty without). You supposedly can’t take them during rush hour (7.30AM to 9.30AM and 6PM to 8PM) but IDK how they enforce it. If you have a registered service dog, you’re good. https://www.metromadrid.es/es/viaja-en-metro/reglamento-del-viajero/acceso-con-animales-domesticos-a-la-red-de-metro",
    country: "United Kingdom",
    city: "London",
    longitude: -0.127758,
    latitude: 51.507351,
    status: 0,
    user: user1,
    category: Category.where(name: "Pets")[0]
  )

  puts "+ #{tip.title}"

  tip = Tip.create!(
    title: "Cats and other animals in the subway",
    content: "Please don’t be that crazy person that takes a ferret in the subway with a leash. If you have to take your cat or other small animals in the subway or bus, please use a carrier!",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Pets")[0]
  )

  puts "+ #{tip.title}"

  tip = Tip.create!(
    title: "Talking to strangers in the subway",
    content: "If you start talking to a random person in the subway, people will probably think you’re either crazy or flirting with them. Very occasionally some conversations among several people start, mostly to complain about the service, and it’s mostly older people.",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Transportation")[0]
    )

  puts "+ #{tip.title}"

  tip = Tip.create!(
    title: "PDA - gay couples",
    content: "Spain is a pretty open-minded country, especially big cities (hello Chueca!). I’ve seen many times gay couples being all lovey-dovey and holding hands in the street and public transportation. Very rarely news pop up of some people verbally harassing couples in the subway or the street, but generally everyone around will defend their rights.",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Sex and relationships")[0]
    )

  puts "+ #{tip.title}"

  tip = Tip.create!(
    title: "Going to work in the subway",
    content: "It’s very common in Madrid to use the subway to get to work. It’s safe and it’s open pretty early, but it will be very crowded in rush hour!",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Work")[0]
    )

  puts "+ #{tip.title}"

  tip = Tip.create!(
    title: "Movistar has the best coverage.",
    content: "If you plan to come to Madrid and you are looking for the best available telephone company, you must take into account the rates, data plans and coverage. You want to be always connected, even on the metro… 4G+ coverage is already a reality. Movistar’s service is still the best, even though many operators share facilities. Ah, and you can use your cellular phone in the subway!",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Utilities")[0]
    )

  puts "+ #{tip.title}"

    tip = Tip.create!(
    title: "Movistar has the best coverage.",
    content: "From enjoying the experience of eating in a 5 Michelin star restaurant or simply eating a tortilla sandwich during your journey by subway, Madrid has a wide range of tasty options and for all pockets. There are food franchises that offer Spanish product at a lower price and with fast food benefits. In Madrid, restaurants such as Rodilla, Pans &Company and 100 Montaditos offer the best value for money. 2€ for a sandwich and a beer!",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Food")[0]
    )

 puts "+ #{tip.title}"

    tip = Tip.create!(
    title: "Music in the subway.",
    content: "It's common to see performers in the subway, mostly singer/musicians. They're not dangerous, they just want some money and they're normally very polite. You can give some change if you want and they're good :).",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Culture")[0]
    )

  puts "+ #{tip.title}"

  tip = Tip.create!(
    title: "'Bocata', the spanish sub.",
    content: "Even though there are a few Subways in Madrid, avoid them! Most of what people call here a sub is a 'bocata' or 'bocadillo', but in reality the bread is pretty different, and very yummy! It's crunchy outside and soft inside. One of the most typical ones in Madrid are the calamri ones. Try one in the Plaza Mayor!",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Food")[0]
    )

 puts "+ #{tip.title}"

  # puts 'Adding 10 fake questions for Barney...'

  # 10.times do
  #   question = Question.create!(
  #     title: Faker::TvShows::HowIMetYourMother.catch_phrase,
  #     city: "Paris",
  #     status: 0,
  #     category: Category.all.sample,
  #     user: user1
  #   )

  #   puts "? #{question.title}"
  # end


  # puts 'Adding 15 fake tips for Barney in Paris...'

  # 15.times do
  #   tip = Tip.create!(
  #     title: Faker::TvShows::ParksAndRec.character,
  #     content: Faker::TvShows::HowIMetYourMother.quote,
  #     city: "Paris",
  #     longitude: 2.349014,
  #     latitude: 48.864716,
  #     status: 0,
  #     user: user1,
  #     category: Category.all.sample
  #   )

  #   puts "+ #{tip.title}"
  # end

  puts 'Creating user2'
  puts '------------------'

  user2 = User.create!(email: "ted@mosby.org", password: "password", first_name: "Ted", last_name: "Mosby", username: "The sexless in-keeper")

  puts 'Adding 30 fake tips for Ted in Madrid...'

    tip = Tip.create!(
    title: "Don't get on the subway when there's a soccer game!",
    content: "I'm not kidding, do not ride the subway when there is a big game. Especially right before or right after, the trains are packed so tight you can't breathe. FIND ANOTHER WAY.",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user2,
    category: Category.where(name: "Sports")[0]
    )

  puts "+ #{tip.title}"

    tip = Tip.create!(
    title: "Getting home after a long night out in Madrid.",
    content: "While the subway usually closes around 1am (sometimes earlier),  the bus system in Madrid runs 24/7. It's pretty direct and for the most part you can use your subway card on the bus, although now some buses are slowly accepting contactless payment as well (note sure which ones yet though, sorry!)",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user2,
    category: Category.where(name: "Going out")[0]
    )

  puts "+ #{tip.title}"

    puts "+ #{tip.title}"

    tip = Tip.create!(
    title: "Getting around by subway",
    content: "It is nice that children under 7 yo can travel for free and at any time on the Madrid metro. Children under the age of 4 may travel without a ticket, but they need a Public Transport Card which is free of charge between 4 and 6 yo. Remember to validate it by the reader machine! Should be very confortable, usually there are spaces and special seats for babies on buses and metro wagons.",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Children")[0]
    )

  puts "+ #{tip.title}"

    tip = Tip.create!(
    title: "Where to get a subway/bus card",
    content: "Your subway card is the same as your bus card. It costs money to get a new one so it's best not to lose it. You can ONLY buy them in the subway stations. Nowadays some buses are accepting contactless payment, but the rollout has been slow so don't count on it.",
    country: "Spain",
    city: "Madrid",
    longitude: -3.703790,
    latitude: 40.416775,
    status: 0,
    user: user1,
    category: Category.where(name: "Transportation")[0]
    )

  puts "+ #{tip.title}"

  # 30.times do
  #   tip = Tip.create!(
  #     title: Faker::TvShows::ParksAndRec.character,
  #     content: Faker::TvShows::HowIMetYourMother.quote,
  #     city: "Paris",
  #     longitude: 2.349014,
  #     latitude: 48.864716,
  #     status: 0,
  #     user: user2,
  #     category: Category.all.sample
  #   )

  #   puts "+ #{tip.title}"
  # end

  # puts 'Creating 10 fake questions for Ted...'

  # 10.times do
  #   question = Question.create!(
  #     title: Faker::TvShows::HowIMetYourMother.catch_phrase,
  #     country: "Spain",
  #     city: "Madrid",
  #     status: 0,
  #     category: Category.all.sample,
  #     user: user2
  #   )

  #   puts "? #{question.title}"
  # end

  puts 'Creating 3 User cities'
  puts '------------------'

  city_madrid = UserCity.create!(user_id: 1, name: 'Madrid')
  # city_paris = UserCity.create!(user_id: 1, name: 'Paris')
  # city_london = UserCity.create!(user_id: 2, name: 'London')

  # puts "> #{city_madrid.name}"
  # puts "> #{city_london.name}"
  # puts "> #{city_paris.name}"


  puts "Finished seeding!!!"
end
