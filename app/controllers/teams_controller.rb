class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
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

  def new
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html {redirect_to @team, notice: "The team was successfully created"}
      else
        format.html {render :new}
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
      :team_contact,
      :address1,
      :address2,
      :city,
      :state,
      :zipcode)
  end

end
