# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Entry.destroy_all
Category.destroy_all


20.times do 
User.create(username: Faker::Name.name,
 email: Faker::Internet.email, password: "123"
 )
end

categories = ["childcare",
     "medical",
     "housing",
     "food",
     "transportation",
     "savings",
     "taxes",
     "other"]

     categories.each do |c|
          Category.create(name:c
          )
     end

month=["January", "February", "March", "April", "May", "June", "July",
"August", "September", "October", "November", "December"]


20.times do
     Entry.create( details:Faker::Company.name,
      amount:Faker::Number.decimal_part(digits: 2),
       month:month.sample,
       user:User.all.sample,
       category: Category.all.sample)
end



puts "
ya
"