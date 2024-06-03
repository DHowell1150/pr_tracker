class AthletesController < ApplicationController
  def index
    require 'pry' ; binding.pry
    @user = User.create!(username: "Dana Howell", email: "howelld115@gmail.com", password: "test")

    @athletes = Athlete.all
  end

  def new
    # @athlete = Athlete.new
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
    @athlete = Athlete.find(params[:id])
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