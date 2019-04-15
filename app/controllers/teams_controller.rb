class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :edit, :update, :destroy]

  def index
    @teams = Team.all
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
      flash[:success] = "Team Successfully Created"
      redirect_to team_path(@team)
    else
      flash[:danger] = @team.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      flash[:success] = "Whew! Glad we got that updated"
      redirect_to @team
    else
      flash[:danger] = @team.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    if @team.destroy
      render 'index'
      flash[:success] = "Team was deleted"
    else
      flash[:danger] = @team.errors.full_messages.to_sentence
      redirect_to team_path(@team)
    end
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
