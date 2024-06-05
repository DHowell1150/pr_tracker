class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def new
    #with form_with @model knows its a new (no :id in params) so send it to POST
    @new_athlete = Athlete.new
  end

  def create
    @new_athlete = Athlete.new(athlete_params)
    @new_athlete = current_user.athletes.build(athlete_params)
    if @new_athlete.save
      redirect_to athletes_path
      flash[:success] = "'#{@new_athlete.name}' created successfully."
    # else
      # flash[:error] = "Sorry, your Athlete doesn't have the correct credentials"
      # render new_athlete_path
    else
      logger.error @new_athlete.errors.full_messages # Log validation errors
      render new_athlete_path
    end
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  private
  def athlete_params
    params.require(:athlete).permit(:name, :gender, :feet, :inches, :weight, :birthday)
  end
end