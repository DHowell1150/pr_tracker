class MovementsController < ApplicationController

  def new
    # Standard new action
    @movement = Movement.new
    # restrict choices of names
    @movement_names = ["Hammer Curls", "Olympic Squat", "Dumbbell Bench Press", "Seated Cable Rows", "Barbell Deadlift"]
  end

  def create
    # Standard create action
    @movement_name = @movement.name
    # Uses the private method
    @instructions = fetch_instructions(@movement_name)
    # if @instructions
    #   flash[:notice] = "Instructions fetched successfully."
    # else
    #   flash[:alert] = "Failed to fetch instructions."
    # end
    
    # Standard render action
    render :new
  end
    
  def show
    # Standard show action
    @movement = Movement.find(params[:id])
  end

private

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