# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#팀 시드
team=[
[1,1,"2018-01-01"],
[2,2,"2018-02-01"],
[3,3,"2018-03-01"],
[4,4,"2018-04-01"],
]
team.each do |id,number,study_date|
  Team.create!(id: id,number: number, study_date: study_date)
end
# 유저 시드
user=[
["강민경",1,"bbeternal@likelion.org","testtest","testtest"],
["이승규",1,"zx6658@likelion.org","testtest","testtest"],
["심지선",2,"si4420@likelion.org","testtest","testtest"],
["홍동우",2,"sapot1998@gmail.com","testtest","testtest"],
["송정우",3,"song@liklion.org","testtest","testtest"],
["류효광",3,"ryu@likelion.org","testtest","testtest"],
]
user.each do |name,team_id,email,password,password_confirmation|
  User.create!(name: name,team_id: team_id, email: email,password: password,password_confirmation: password_confirmation)
end
