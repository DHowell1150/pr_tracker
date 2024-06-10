class ApiNinjasController < ApplicationController
  def index
    
    url = "https://api.api-ninjas.com"
    uri = "/v1/exercises?name="

    conn = Faraday.new(url: url) do |faraday|
      faraday.headers['X-Api-Key'] = Rails.application.credentials.ninja_api[:key]
    end
    response = conn.get(uri)
    json = JSON.parse(response.body, symbolize_names: true)

    @movements_by_name = []
    json.each do |movement_data|
      @movements_by_name << movement_data
    end
  end
end