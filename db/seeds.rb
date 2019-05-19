# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "Nirchi's", address: "3619 Vestal Parkway, Vestal, NY 13850", phone_number: "607-729-5131", description: "We serve pizza and italian cuisine", user_id: 1)
Restaurant.create(name: "Number 5", address: "33 South Washington St. Binghamton, NY 13903", phone_number: "607-723-0555", description: "Prime Steaks, Fresh Seafood Since 1978", user_id: 1)
Restaurant.create(name: "Lost Dog Cafe", address: "222 Water Street, Binghamton, NY 13901", phone_number: "607-771-6063", description: "Serves lunch, dinner, coffee and drinks", user_id: 2)
Food.create(name: "Pasta", price: "5", tags: "italian;pasta;sauce;delicious", restaurant_id: 3, rating: 0, number_of_ratings: 0)