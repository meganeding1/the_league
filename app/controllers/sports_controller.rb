class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end


  def new
    @sport = Sport.new
  end

  def create
    p sport_params
    p "*"*100
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to @sport
    else
      render 'new'
    end
  end

  def edit

  end

  def show
    @sport = Sport.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
    def sport_params
      params.require(:sport).permit(:name, :description)
    end



end

