class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @new_athlete = Athlete.new(athlete_params)
    @new_athlete.save
    flash[:success] = "'#{@new_athlete.name}' created successfully."
    redirect_to athletes_path
    # else
    #   flash[:error] = "Sorry, your Athlete doesn't have the correct credentials"
    #   render new_athlete_path
    # end
  end

  def show

  end

  private
  def athlete_params
    params.require(:athlete).permit(:name, 
                                    :gender, 
                                    :height, 
                                    :weight, 
                                    :birthday)
  end
end