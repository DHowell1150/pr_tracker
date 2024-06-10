class AthletesController < ApplicationController
  def index
    # @athletes = current_user.athletes
    @athletes = Athlete.all #I saw @athletes = current_user.athletes. `current_user` works in pry but is an "undefined method" when ran in terminal
    # flash.now[:notice] = "No athletes found" if @athletes.empty?
  end

  def new
    #with form_with @model knows its a new (no :id in params) so send it to POST
    @new_athlete = Athlete.new
  end

  # def create
  #   @new_athlete = current_user.athletes.build(athlete_params)
  #   if @new_athlete.save
  #     flash[:success] = "#{@new_athlete.name} created successfully."
  #     redirect_to athletes_path
  #   else
  #     flash[:errors] = @new_athlete.errors.full_messages.to_sentence
  #     redirect_to new_athlete_path
  #   end
  # end


  def create
    @new_athlete = current_user.athletes.build(athlete_params)
    if @new_athlete.save
      flash[:notice] = "#{@new_athlete.name} created successfully."
      redirect_to athletes_path
    else
      flash[:error] = @new_athlete.errors.full_messages.to_sentence
      # puts flash[:error] # Debugging line
      render :new
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
    if @athlete.update(athlete_params)
      flash[:success] = "Athlete successfully updated."
      redirect_to athlete_path(@athlete)
    else
      flash[:errors] = @athlete.errors.full_messages.to_sentence
      redirect_to edit_athlete_path(@athlete)
    end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    @athlete.delete
    flash[:success] = "Athlete successfully deleted"
    redirect_to athletes_path
  end

  private
  def athlete_params
    params.require(:athlete).permit(:name, :gender, :feet, :inches, :weight, :birthday)
  end
end