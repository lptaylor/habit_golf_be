# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


player = Player.create(name: "Shooter McGavin", email: "shooter@gmail.com", password:"password")
player.player_stats.create(hook_percentage: 19.1, pull_percentage: 27.0, great_shot_percentage: 10.3, push_percentage: 23.6, slice_percentage: 20.0)

wedge = Club.create(style_of_club: 1)
driver = Club.create(style_of_club: 2)
iron = Club.create(style_of_club: 3)

shot_1 = wedge.shots.create(rating: 1)
shot_2 = wedge.shots.create(rating: 2)
shot_3 = wedge.shots.create(rating: 2)
shot_4 = wedge.shots.create(rating: 3)
shot_5 = wedge.shots.create(rating: 4)

shot_6 = driver.shots.create(rating: 2)
shot_7 = driver.shots.create(rating: 1)
shot_8 = driver.shots.create(rating: 5)
shot_9 = driver.shots.create(rating: 5)
shot_10 = driver.shots.create(rating: 5)

shot_11 = iron.shots.create(rating: 4)
shot_12 = iron.shots.create(rating: 5)
shot_13 = iron.shots.create(rating: 5)
shot_14 = iron.shots.create(rating: 5)
shot_15 = iron.shots.create(rating: 1)
