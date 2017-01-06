class GamesController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @games = @team.games
  end

  def new
    @team = Team.find(params[:team_id])
    @game = @team.games.new
  end

  def create
    @team = Team.find(params[:team_id])
    @game = @team.games.new(game_params)

    if @game.save
      redirect_to team_games_path
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @date = @game.date
    @location = @game.location
  end

  private

  def game_params
    params.require(:game).permit(:date,:location, :team_1, :team_2)
  end
end
