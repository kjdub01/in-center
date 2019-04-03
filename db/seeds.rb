# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.create(team_name: "Dallas Reds", contact_name: "Joe Carisle", contact_phone: "214-545-7845", address1: "Lake Highlands Field", address2: "1000 N Buckner Blvd", city: "Dallas", state: "Texas", zipcode: "75218")
Team.create(team_name: "Dallas Harlequins", contact_name: "Dave Eiswerth", contact_phone: "214-313-4335", address1: "Glencoe Park", address2: "5300 Martel Ave", city: "Dallas", state: "Texas", zipcode: "75206")
Game.create(user_id: 1)
GamesTeam.create(game_id: 1, team_id: 1)
GamesTeam.create(game_id: 1, team_id: 2, home_team: true)
