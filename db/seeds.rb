puts "start seed"

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
    address: "36 Place de la Victoire, 33000 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206548/103423796-McPick2-FOF-Header.1910x1000.jpg"
  },

  {
    name: "Chez Peppone",
    category_id: Category.second.id,
    address: "cours Georges Clemenceau, 33000 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206547/15342_w600.jpg"
    },

  {
    name: "Chez maitre Tang",
    category_id: Category.third.id,
    address: "37 Rue Saint-Rémi, 33000 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206548/cuisine-vietnamienne.jpg"
    },

  {
    name: "Le Taj Mahal",
    category_id: Category.last.id,
    address: "24 Rue Parlement Sainte-Catherine, 33000 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206547/GettyImages-169944128-587af9fe3df78c17b636d4f2.jpg"
    },

  {
    name: "La Brasserie Bordelaise",
    category_id: Category.second.id,
    address: "50 Rue Saint-Rémi, 33000 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206496/Bouchon-lyonnais.jpg"
    },

  {
    name: "Cappadoce",
    category_id: Category.third.id,
    address: "5 Rue Bahutiers, 33000 Bordeaux",
    remote_picture_url: "https://res.cloudinary.com/didys4vkv/image/upload/v1519206496/shutterstock202575529.jpg"
    }
]

  restaurants_data.each do |resto|
    Restaurant.create!(resto)
  end

puts "end resto"

puts "end seed"
