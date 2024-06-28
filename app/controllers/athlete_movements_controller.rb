class AthleteMovementsController < ApplicationController
  def new
    @athlete = Athlete.find(params[:athlete_id])
    redirect_to new_movement_path
    @new_movement = @athlete.movements.build
    @instructions = fetch_instructions(@new_movement.name)

  end

  def create

  end
end

private

def movement_params
  params.require(:movement).permit(:name, :description, :image, :video4, :athlete_id) #.merge(athlete_id: params[:athlete_id])
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
end