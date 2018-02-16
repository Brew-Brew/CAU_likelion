# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
team=[
[1,1,"2018-01-01"],
[2,2,"2018-01-01"],
[3,3,"2018-01-01"],
[4,4,"2018-01-01"],
]
team.each do |id,number,study_date|
  Team.create(id: id,number: number, study_date: study_date)
end
