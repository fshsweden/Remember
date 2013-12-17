# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'fshsweden@hotmail.com', password: 'ou812wowu812', password_confirmation: 'ou812wowu812')
puts 'new User created: ' << user.email
user = User.create!(email: 'fshsweden2@hotmail.com', password: 'ou812wowu812', password_confirmation: 'ou812wowu812')
puts 'new User created: ' << user.email
user = User.create!(email: 'fshsweden3@hotmail.com', password: 'ou812wowu812', password_confirmation: 'ou812wowu812')
puts 'new User created: ' << user.email
