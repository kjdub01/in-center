class GamesController < ApplicationController
  before_action :set_game, only:[:show, :edit, :update]
  def index

  end

  def show
    @home_team = @game.teams[0]
    @away_team = @game.teams[1]
  end

  def new
    @game = Game.new
    2.times { @game.games_team.build }
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:user_id, :starts_at, games_team_attributes:[:id, :game_id, :team_id, :home_team])
  end


end
