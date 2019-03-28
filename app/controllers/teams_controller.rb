class TeamsController < ApplicationController

  def index
    if params[:game_id]
      @game = Game.find_by(id: params[:game_id])
      if @game.nil
        redirect_to games_path, alert: "Game not found"
      else
        @teams = @games.teams
      end
    else
      @teams = Team.all
    end
  end

  def show
    if params[:teams_id]
      @game = Game.find_by(id: params[:team_id])
      @team = @game.teams.find_by(id: params[:id])
      if @game.nil
        redirect_to game_teams_path(@game) alert: "Game not found"
      end
    else
      @games = Game.find(params[:id])
    end
  end
end
