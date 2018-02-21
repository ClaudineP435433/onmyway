puts "start seed"

Booking.destroy_all
Delivery.destroy_all
User.destroy_all
Restaurant.destroy_all
Category.destroy_all


category = ["Kebab", "Chinese", "Italian", "French", "Burger", "Japanese", "Snack Bar", "Indian"]

category.each { |cat| Category.create(name: cat) }

puts "cat ok"
puts "resto start"

restaurants_data = [
  {
    name: "Mc donalds",
    category_id: Category.first.id,
    address: "40 Avenue Thiers, 33100 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206548/103423796-McPick2-FOF-Header.1910x1000.jpg"
  },

  {
    name: "Pizza nico",
    category_id: Category.second.id,
    address: "115 cours Balguerie Stuttenberg, 33300 bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206547/15342_w600.jpg"
    },

  {
    name: "Chez maitre Tang",
    category_id: Category.third.id,
    address: "5 rue Monge, 75005 paris",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206548/cuisine-vietnamienne.jpg"
    },

  {
    name: "Curry folies",
    category_id: Category.last.id,
    address: "35 Avenue du Mont Riboudet, 76000 Rouen",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206547/GettyImages-169944128-587af9fe3df78c17b636d4f2.jpg"
    },

  {
    name: "Le bouchon",
    category_id: Category.second.id,
    address: "32 Boulevard Schloesing, 13009 Marseille",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206496/Bouchon-lyonnais.jpg"
    },

  {
    name: "Keboul Wesh",
    category_id: Category.third.id,
    address: "39 Avenue Jean Giono, 13100 Aix-en-Provence",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206496/shutterstock202575529.jpg"
    }
]

  restaurants_data.each do |resto|
    Restaurant.create!(resto)
  end

puts "end resto"

puts "user"

10.times do
  user = User.new(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.street_address,
  remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519145311/m5ltelbmzkr4kc1zz99q.jpg"
  )
  user.save!
end

puts "deliv"

15.times do
  deliv = Delivery.new(
  restaurant_id: (Restaurant.first.id..Restaurant.last.id).to_a.sample,
  user_id: (User.first.id..User.last.id).to_a.sample,
  closing_at: DateTime.now,
  )
  deliv.save!
end

puts "bookings"

5.times do
  book = Booking.new(
    user_id: (User.first.id..User.last.id).to_a.sample,
    delivery_id: (Delivery.first.id..Delivery.last.id).to_a.sample,
    content: "Maxi menu best-of BigMac pour 4 EUR",
    )
  book.save!
end




puts "end seed"
