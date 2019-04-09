class GamesController < ApplicationController
  before_action :set_game, only:[:show, :edit, :update]
  def index
    if params[:team_id]
      @games = Team.find(params[:team_id]).games

    elsif params[:user_id]
      @games = User.find(params[:user_id]).games
      
    else
      @games = Game.all
    end
  end

  def show
    @home_team = @game.home_team
    @away_team = @game.away_team
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
