# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = User.create!(email: "sonik.jhang@utexas.edu")
User.create!(email: "sonik4595@gmail.com")
User.create!(email: "mike@gmail.com")
User.create!(email: "appAcademy@gmail.com")

b = ShortenedUrl.create_for_user_and_long_url!(a, "lfwaejfoi028934uj2qiowrejnaw083oi4erujwa0eoirujow408ioruq2jw0iaefok")

Visit.record_visit!(a, b)
