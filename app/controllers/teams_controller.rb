class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create

    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
    @users = @team.users
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to @team
    else
      render "edit"
    end
  end

  private
    def team_params
      params.require(:team).permit(:name, :user_id, :sport_id)
    end
end

