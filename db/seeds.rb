# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name: "learning app",redirect_uri: "",scopes:"")
end

User.first_or_create(email:"avan@rq.com",
                    password:'avan',
                    password_confirmation:'avan',
                    name:'Avantika S',
                    mobile:'7358630327',
                    dob:Date.new(2001,4,25))