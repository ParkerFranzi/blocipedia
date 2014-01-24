# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# useful way to have a default record every time you need to db:reset

u = User.new(email: 'guy@guy.com', password: 'password', password_confirmation: 'password')
u.skip_confirmation! and u.save!