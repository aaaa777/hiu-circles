# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(
  email: "a@a.a",
)
user.update!(
  password: "aaaaaa",
  first_name: "太郎",
  last_name: "山田",
)

user.skip_confirmation!
user.save!

Circle.find_or_create_by!(
  name: "サークルA",
).save!

Member.find_or_create_by!(
  user: User.first,
  circle: Circle.first
).update!(
  status: "joined"
)