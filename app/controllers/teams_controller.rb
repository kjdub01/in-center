class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    if params[:game_id]
      @game = Game.find_by(id: params[:game_id])
      if @game.nil
        redirect_to games_path
      else
        @teams = @games.teams
      end
    else
      @teams = Team.all
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(
      :team_name,
      :contact_name,
      :contact_phone,
      :address1,
      :address2,
      :city,
      :state,
      :zipcode)
  end

end
