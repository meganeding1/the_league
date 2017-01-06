class TeamsController < ApplicationController

  def new
    @sport = Sport.find(params[:sport_id])
    @team = Team.new
  end

  def create
    sport = Sport.find(params[:sport_id])
    # User becomes team captain but only when you call team.team_captain
    @team = current_user.teams.new({name: params[:team][:name], user_id: current_user.id, sport_id: sport.id})

    if @team.save
      @team.users.push(current_user)
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
    @games = @team.games
  end

  def update
    @team = Team.find(params[:id])
    @team.users.each do |user|
      if user.username != params[:team][:team_captain][:username]
        flash[:alert] = 'User not on team!'

        render "edit"
      else
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
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team Deleted"
    redirect_to "/"


  end


  private
    def team_params
      params.require(:team).permit(:name , :user_id, :sport_id)
    end
end
