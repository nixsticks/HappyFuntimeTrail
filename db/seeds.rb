# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#NOT CURRENTLY WORKING

test_user = User.create(username: "switzerswish",
                        first_name: "Oliver",
                        last_name: "Switzer",
                        email: "oliverswitzer@gmail.com",
                        password: "oliver123",
                        password_confirmation: "oliver123")

test_trail = Trail.create(length: 10, popularity: 4, description: "OOOH SO PERTY TRAIL IS THE NATUREZ", name: "Nature Trail")

test_trail = Trail.find_by_name("Nature Trail")
test_user = User.find_by_username("switzerswish")
test_trail.creator = test_user
test_trail.save