module GamesHelper

  def game_time(game)
    game.starts_at.strftime("%l:%M %P")
  end

  def game_date(game)
    game.date.strftime("%-m/%-d/%Y")
  end
end
