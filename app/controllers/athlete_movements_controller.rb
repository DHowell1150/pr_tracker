class AthleteMovementsController < ApplicationController

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @new_movement = @athlete.movements.build
    @instructions = fetch_instructions(@new_movement.name)
    
    # @movements_with_instructions = @athlete.movements.map do |movement|
    #   instructions = fetch_instructions(movement.name)
    #   { movement: movement, instructions: instructions }
    # end

    # @athlete_movement = Movement.new
    # @new_movement = Movement.find_by(athlete_id: @athlete.id, id: @movement.id)
    # restrict choices of names by hardcoding for now
    # @movement_name = [
    #                     "Pullups", 
    #                     "Olympic Squat", 
    #                     "Dumbbell Bench Press", 
    #                     "Clean and jerk", 
    #                     "Barbell Deadlift"
    #                   ]
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @new_movement = @athlete.movements.build(movement_params)
    # @athlete.movements << @movement
    # @new_movement = @athlete.movements.last #refactor this
    # @new_movement = @athlete.movements.find_by(athlete_id: @athlete.id, id: @movement.id)

    if @new_movement.save
      # @movement_name = @new_movement.name
      # @instructions = fetch_instructions(@new_movement.name)

      redirect_to athlete_path(@athlete)
    #   if @instructions
    #     flash[:notice] = "Instructions fetched successfully."
    #   end
    else
    #     flash[:alert] = "Failed to fetch instructions."
      
      render :new
    end
  end
    
  def show
    @movement = Movement.find(params[:id])
    # @instructions = fetch_instructions(@movement.name)
  end

private

  def movement_params
    params.require(:movement).permit(:name, :description, :image, :video) #.merge(athlete_id: params[:athlete_id])
  end

  # Makes the API call - would normally be handled by the facade
  def fetch_instructions(movement_name)
    url = "https://api.api-ninjas.com"
    uri = "/v1/exercises?name=#{movement_name}"

    conn = Faraday.new(url: url) do |faraday|
      faraday.headers['X-Api-Key'] = Rails.application.credentials.ninja_api[:key]
    end

    response = conn.get(uri)
    json = JSON.parse(response.body, symbolize_names: true)
    json.first[:instructions]



    # No longer needed because we are able to search dynamically by name, instead of dumping everything from the blank name API call
      # @movement_instructions = []
      # json.each do |movement_data|
      # # require "pry"; binding.pry
      #   @movement_instructions << movement_data[:instructions]
      # end
  end
end