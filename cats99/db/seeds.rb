# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


colors = %w(Blue Green Red Yellow Pink Purple Orange Black Gray White Brown)

cats = []

20.times do |i|
  cat = Cat.new
  cat.birth_date = Date.today - i*10
  cat.color = colors.sample
  cat.name = "cat#{i+1}"
  cat.sex = ["M", "F"].sample
  cat.description = "#{i} Very" + "Cool" * ( i + 1 )
  cat.save!
end
