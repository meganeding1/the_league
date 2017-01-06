class GamesController < ApplicationController
  def index
    @sport = Sport.find(params[:sport_id])
    @games = @sport.games
  end

  def show
    @game = Game.find(params[:id])

  end
end
