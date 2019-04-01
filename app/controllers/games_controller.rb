class GamesController < ApplicationController
  before_action :set_game, only:[:show, :edit, :update]
  def index

  end

  def show
  end

  def new
    @game = Game.new
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
    params.require(:game).permit(:user_id, :starts_at)
  end


end
