# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: "Liz", last_name: "Fitz", username: "elizfitz", email: "elizfitz@gmail.com", password: "Password1")
user2 = User.create(first_name: "James", last_name: "Francis", username: "jfitz8", email: "jfitz8@gmail.com", password: "Password2")

post = Post.create(title: "First Post", body: "This is my first post. I am so excited!", user: user)

comment = Comment.create(body: "This is a terrible post!", user: user2, post: post)