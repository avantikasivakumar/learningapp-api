# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# if Doorkeeper::Application.count.zero?
#     Doorkeeper::Application.create!(name: "learning app",redirect_uri: "",scopes:"")
# end

User.first_or_create(email:"avan@rq.com",
                    password:'avan',
                    password_confirmation:'avan',
                    name:'Avantika S',
                    mobile:'7358630327',
                    dob:Date.new(2001,4,25))


Board.first_or_create(
    "title": "CBSE",
                "name": "Central Board of Secondary Education",
                "image":"/cbse"
)

# Board.create(
#     "title": "ICSE",
#                 "name": "Indian Certificate of Secondary Education",
#                 "image":"/icse"
# )

# Board.create("title": "Tamil Nadu State Board",
# "name": "Tamil Nadu Board of Higher Secondary Education",
# "image":"/tnsb")

# for i in 5..12
#     Classn.create(title:i)
# end

# Subject.create(title:'Math',image:'\mathpic')
# Subject.create(title:'Geography',image:'\geo')
# Subject.create(title:'Physics',image:'\phy')
# Subject.create(title:'Biology',image:'\bio')
# Subject.create(title:'Chemistry',image:'\chem')
# boards=[1,2,3]
# classes=[1,2,3,4,5,6,7,8]
# subjects=[1,2,3,4,5]

# for board in boards
#     for clas in classes
#         for subject in subjects
#             Course.create!(board_id:board,classn_id:clas,subject_id:subject)
#         end
#     end
# end

# Topic.create!(name:'Trig',course_id:'5')
# Topic.create!(name:'functions',course_id:'5')