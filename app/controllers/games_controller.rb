class GamesController < ApplicationController
  before_action :set_game, only:[:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :edit, :update, :destroy]

  def index
    if params[:team_id]
      @games = Team.find(params[:team_id]).games
      @team = Team.find(params[:team_id])
    elsif params[:user_id]
      @games = User.find(params[:user_id]).games
      @user = User.find(params[:user_id])
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
      flash[:success] = "Game was successfully created!"
      redirect_to game_path(@game)
    else
      flash[:danger] = @game.errors.full_messages.to_sentence
      flash[:danger] = @game.games_team.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      flash[:success] = "Whew! Glad we got that updated"
      redirect_to @game
    else
      flash[:danger] = @game.errors.full_messages.to_sentence
      flash[:danger] = @game.games_team.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    if @game.destroy
      flash[:success] = "Game deleted"
      redirect_to games_path
    else
      flash[:danger] = @game.errors.full_messages.to_sentence
      redirect_to game_path(@game)
    end
  end

  def unassigned
    @games = Game.unassigned
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:user_id, :starts_at, :date, games_team_attributes:[:id, :game_id, :team_id, :home_team])
  end


end
