# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create( 
        email: 'admin@example.com', 
        password: '12345678',
        password_confirmation: '12345678'
      )

plan1 = Plan.create(
        name: "Early Bird",
        price: 150,
        start_time: "2015-06-13"
      )

plan2 = Plan.create(
        name: "Regular Ticket",
        price: 150,
        start_time: "2015-06-20"
      )

plan3 = Plan.create(
        name: "Late Ticket",
        price: 150,
        start_time: "2015-08-13"
      )

admin.admin!