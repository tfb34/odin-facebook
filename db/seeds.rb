# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'Mary', email: 'example@gmail.com',
						 birthdate: Date.new(1985,4,6))

User.create(name: 'Erik', email: 'example2@gmail.com',
						birthdate: Date.new(1979,7,20))

User.create(name: 'Hewlitt', email: 'example3@gmail.com',
							birthdate: Date.new(1994,12, 14))
