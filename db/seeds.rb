# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

reds = Team.create(team_name: "Dallas Reds", contact_name: "Joe Carisle", contact_number: "214-545-7845", address1: "Lake Highlands Field", address2: "1000 N Buckner Blvd", city: "Dallas", state: "Texas", zipcode: "75218")
quins = Team.create(team_name: "Dallas Harlequins", contact_name: "Dave Eiswerth", contact_number: "214-313-4335", address1: "Glencoe Park", address2: "5300 Martel Ave", city: "Dallas", state: "Texas", zipcode: "75206")
kate = User.create(name: "Kate Jewett-Williams", number: "405-550-0465", address1: "2363 S. Elm St.", city: "Dallas", state: "Texas", zipcode: "74523")
game1 = Game.create(home_team_id: 1, away_team_id: 2, date_kickoff: "3/16/19", time_kickoff: "2:00 p.m.")
