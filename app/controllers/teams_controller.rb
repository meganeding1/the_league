class TeamsController < ApplicationController
  before_action :show_teams, only: [:show, :create]

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

    def show_teams
      @team = Team.find(params[:id])
      @users = @team.users
      @games = @team.games

      # respond_to do |format|
      #     # format.js { render :file => "/views/teams/new.js.erb"}
      #     format.js {render 'new'}
      #     @users << current_user
      #     format.html { render 'show' }
      # end

      if request.xhr?
        @users << current_user
        render "show"
      end


    end


    def team_params
      params.require(:team).permit(:name , :user_id, :sport_id)
    end

end
