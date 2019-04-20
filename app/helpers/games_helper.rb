module GamesHelper

  def game_time(game)
    game.starts_at.strftime("%l:%M %P")
  end

  def game_date(game)
    game.starts_at.strftime("%-m/%-d/%Y")
  end

  def game_end(game)
    end_time = game.starts_at + 80.minutes
    end_time.strftime("%l:%M %P")
  end

  def user
    params[:user_id]
  end

  def team
    if params[:team_id]
      team = Team.find(params[:team_id])
    end
  end
end
