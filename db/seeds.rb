# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'Mary', email: 'example@example.com',
						 birthdate: Date.new(1985,4,6),
						 password: "password")

User.create(name: 'Erik', email: 'example2@example.com',
						birthdate: Date.new(1979,7,20),
						password: "password")

User.create(name: 'Hewlitt', email: 'example3@example.com',
							birthdate: Date.new(1994,12, 14),
							password: "password")

10.times do |t|
    User.first.posts.create(content: "We must not make a scarecrow of the law,
                                      Setting it up to fear the birds of prey,
                                      And let it keep one shape, till custom make it
                                      Their perch and not their terror.")

end

10.times do |t|
    User.last.posts.create(content: "Ay, but yet
                                    Let us be keen, and rather cut a little,
                                    Than fall, and bruise to death. Alas, this gentleman
                                    Whom I would save, had a most noble father!
                                    Let but your honour know,
                                    Whom I believe to be most strait in virtue,
                                    That, in the working of your own affections,
                                    Had time cohered with place or place with wishing,
                                    Or that the resolute acting of your blood
                                    Could have attain'd the effect of your own purpose,
                                    Whether you had not sometime in your life
                                    Err'd in this point which now you censure him,
                                    And pull'd the law upon you")
end

30.times do |t|
    User.create(name: Faker::Name.name,
                email: Faker::Internet.unique.email,
                birthdate: Faker::Date.birthday,
                password: "password")
end


(2..20).times do |t|
    Friendship.create(user_id: 1, friend_id: t)
end