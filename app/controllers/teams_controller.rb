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
    @sport = Sport.find(params[:id])
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
    @users = @team.users
  end

  def update
    @team = Team.find(params[:id])
    @user = User.find_by(username: params[:team][:team_captain][:username])
    if @user == nil
      @team.errors.add(:team_captain, "Nope.")
      render "edit"
    elsif @team.update(name: params[:team][:name], user_id: @user.id)
      redirect_to @team
    else
      render "edit"
    end
  end

  # private
  #   def team_params
  #     params.require(:team).permit(:name , :user_id)
  #   end
end

