puts "start seed"

Restaurant.destroy_all
restaurants = [
  {
    name: "Mc donalds",
    address: "26 rue de mes roustons  33000 bordeaux",
    picture: "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2016/02/26/103423796-McPick2-FOF-Header.1910x1000.jpg?v=1456506290"
    },

  {
    name: "Pizza nico",
    address: "26 avenue des champs  33000 bordeaux",
    picture: "https://image.afcdn.com/recipe/20160519/15342_w600.jpg"
    },

  {
    name: "Chez maitre Tang",
    address: "5 rue monge  75000 paris",
    picture: "https://hanoitourist.info/wp-content/uploads/2017/01/tet-4.jpg"
    },

  {
    name: "Curry folies",
    address: "33 avenue des champs  33000 bordeaux",
    picture: "https://fthmb.tqn.com/sMS4T7yea_uM00Gg2RAA5ORfiSg=/2121x1414/filters:fill(auto,1)/GettyImages-169944128-587af9fe3df78c17b636d4f2.jpg"
    },

  {
    name: "Le bouchon",
    address: "26 rue colonel reyel 33000 bordeaux",
    picture: "http://www.unlyondanslacuisine.fr/Wordpress/wp-content/uploads/2014/11/Bouchon-lyonnais.jpg"
    },

  {
    name: "Keboul Wesh",
    address: "3 avenue mes boules, 33000 bordeaux",
    picture: "https://static2.uk.businessinsider.com/image/5a2275e1c1bde0e0548b5701-2000/shutterstock202575529.jpg"
    },
]

restaurants.each { |restaurant| Restaurant.create(restaurant) }

puts "end seed"
