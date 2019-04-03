# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


player = Player.create(name: "Shooter McGavin", email: "shooter@gmail.com", password:"password")
player.player_stats.create(hook_percentage: 19.1, pull_percentage: 27.0, great_shot_percentage: 10.3, push_percentage: 23.6, slice_percentage: 20.0)
