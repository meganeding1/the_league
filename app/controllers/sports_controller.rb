class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to @sport
    else
      render 'new'
    end
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def show
    @sport = Sport.find(params[:id])
    @teams = @sport.teams
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update(sport_params)
      redirect_to @sport
    else
      render "edit"
    end
  end

  private
    def sport_params
      params.require(:sport).permit(:name, :description)
    end
end
