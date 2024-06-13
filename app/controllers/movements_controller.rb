class MovementsController < ApplicationController

  def new
    @new_movement = Movement.new
    # restrict choices of names by hardcoding for now
    @movement_names = [
                        "Pullups", 
                        "Olympic Squat", 
                        "Dumbbell Bench Press", 
                        "Clean and jerk", 
                        "Barbell Deadlift"
                      ]
  end

  def create
    # @movement = Movement.new(movement_params) # no params for this.  Where are they?!
    @movement_name = @new_movement.name
    @instructions = fetch_instructions(@movement_name)
    # if @instructions
    #   flash[:notice] = "Instructions fetched successfully."
    # else
    #   flash[:alert] = "Failed to fetch instructions."
    # end
    
    render :new
  end
    
  def show
    @movement = Movement.find(params[:id])
  end

private

  def movement_params
    params.require(:movement).permit(:movement, :date, :reps, :weight).merge(athlete_id: params[:athlete_id])
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