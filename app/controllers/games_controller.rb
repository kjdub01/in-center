class GamesController < ApplicationController

  def index
    if params[:team_id]
      @team = Team.find_by(id: params[:team_id])
      if @team.nil
        redirect_to teams_path, alert: "Team not found"
      else
        @games = @teams.games
      end
    else
      @games = Game.all
    end
  end

  def show
    if params[:teams_id]
      @team = Team.find_by(id: params[:team_id])
      @game = @team.games.find_by(id: params[:id])
      if @game.nil
        redirect_to team_games_path(@team) alert: "Game not found"
      end
    else
      @games = Game.find(params[:id])
    end
  end


end
