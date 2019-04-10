# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    yes

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    User has_many Games

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Game belongs_to User

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Game has_many GamesTeam
    Game has_many Teams through GamesTeam

    GamesTeam belongs_to Game

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Team has_many GamesTeam
    Team has_many Games through GamesTeam

    Game has_many GamesTeam
    Game has_many Teams through GamesTeam

    GamesTeam belongs_to Team
    GamesTeam belongs_to Game

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  games_team.home_team

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    User
      has_secure_password
      email presence, length, format, uniqueness
      name presence, length

    Team
      team_name presence
      contact_name presence
      contact_phone presence, format
      address1 presence
      city presence
      state presence
      zipcode presence, format

    Game
      user_id presence
      starts_at presence, format
      date presence, format

    GamesTeam
      home_team custom

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    User/most-games

- [x] Include signup (how e.g. Devise)
    yes
- [x] Include login (how e.g. Devise)
    yes
- [x] Include logout (how e.g. Devise)
    yes
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    yes OmniAuth FB
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
