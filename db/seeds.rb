# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  {
  	first_name: "Sako",
  	last_name: "Hartounian",
  	email: "sakohartounian@yahoo.com",
  	password: "password",
  	password_confirmation: "password",
    admin: true
  },
  {
  	first_name: "James",
  	last_name: "West",
  	email: "jwest@gmail.com",
  	password: "password",
  	password_confirmation: "password",
  }
])

