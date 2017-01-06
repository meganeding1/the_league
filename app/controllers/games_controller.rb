class GamesController < ApplicationController
  def index
    @teams = Team.find(params[:team_id])
    @games = @team.games
  end

  def new
    @team = Team.find(params[:team_id])
    @game = Game.new
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
  end

  private

  def game_params
    params.require(:game).permit(:date, :team_1, :team_2)
  end
end
