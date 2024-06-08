class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def new
    #with form_with @model knows its a new (no :id in params) so send it to POST
    @new_athlete = Athlete.new
  end

  def create
    @new_athlete = current_user.athletes.build(athlete_params)
    if @new_athlete.save
      flash[:success] = "#{@new_athlete.name} created successfully."
      redirect_to athletes_path
    else
      flash[:errors] = @new_athlete.errors.full_messages.to_sentence
      redirect_to new_athlete_path
    end
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:id])
    if @athlete = Athlete.update(athlete_params)
      flash[:success] = "Athlete successfully updated."
      redirect_to athlete_path(@athlete)
    end
  end

  private
  def athlete_params
    params.require(:athlete).permit(:name, :gender, :feet, :inches, :weight, :birthday)
  end
end