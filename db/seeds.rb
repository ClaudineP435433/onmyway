puts "start seed"

Booking.destroy_all
Delivery.destroy_all
User.destroy_all
Restaurant.destroy_all
Category.destroy_all


category = ["Kebab", "Chinese", "Italian", "French", "Burger", "Japanese", "Snack Bar", "Indian"]

category.each { |cat| Category.create(name: cat) }

puts "cat ok"

restaurants_data = [
  {
    name: "Mc donalds",
    category_id: Category.first.id,
    address: "26 rue de mes roustons  33000 bordeaux",
    picture: "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2016/02/26/103423796-McPick2-FOF-Header.1910x1000.jpg"
    },

  {
    name: "Pizza nico",
    category_id: Category.second.id,
    address: "26 avenue des champs  33000 bordeaux",
    picture: "https://image.afcdn.com/recipe/20160519/15342_w600.jpg"
    },

  {
    name: "Chez maitre Tang",
    category_id: Category.third.id,
    address: "5 rue monge  75000 paris",
    picture: "https://hanoitourist.info/wp-content/uploads/2017/01/tet-4.jpg"
    },

  {
    name: "Curry folies",
    category_id: Category.last.id,
    address: "33 avenue des champs  33000 bordeaux",
    picture: "https://fthmb.tqn.com/sMS4T7yea_uM00Gg2RAA5ORfiSg=/2121x1414/filters:fill(auto,1)/GettyImages-169944128-587af9fe3df78c17b636d4f2.jpg"
    },

  {
    name: "Le bouchon",
    category_id: Category.second.id,
    address: "26 rue colonel reyel 33000 bordeaux",
    picture: "http://www.unlyondanslacuisine.fr/Wordpress/wp-content/uploads/2014/11/Bouchon-lyonnais.jpg"
    },

  {
    name: "Keboul Wesh",
    category_id: Category.third.id,
    address: "3 avenue mes boules, 33000 bordeaux",
    picture: "https://static2.uk.businessinsider.com/image/5a2275e1c1bde0e0548b5701-2000/shutterstock202575529.jpg"
    },
]

  restaurants_data.each do |resto|
    Restaurant.create!(resto)
  end


puts "puts user"

10.times do
  user = User.new(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.street_address,
  )
  user.save!
end

puts "deliv"

6.times do
  deliv = Delivery.new(
  restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
  user_id: (User.first.id..User.last.id).to_a.sample,
  closing_at: DateTime.now,
  )
  deliv.save!
end

puts "bookings"

3.times do
  book = Booking.new(
    user_id: (User.first.id..User.last.id).to_a.sample,
    delivery_id: (Delivery.first.id..Delivery.last.id).to_a.sample,
    content: "Maxi menu best-of BigMac pour 4 EUR",
    )
  book.save!
end




puts "end seed"
