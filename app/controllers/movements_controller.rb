class MovementsController < ApplicationController
  def show
    @movement = Movement.find(params[:id])

    url = "https://api.api-ninjas.com"
    uri = "/v1/exercises?name="

    conn = Faraday.new(url: url) do |faraday|
      faraday.headers['X-Api-Key'] = Rails.application.credentials.ninja_api[:key]
    end

    response = conn.get(uri)
    json = JSON.parse(response.body, symbolize_names: true)

    @movement_instructions = []
    json.each do |movement_data|
    # require "pry"; binding.pry
      @movement_instructions << movement_data[:instructions]
    end
  end
end