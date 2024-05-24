class AthletesController < ApplicationController
  def new
    @athlete = Athlete.new
  end

  def create
    require 'pry' ; binding.pry
    redirect_to athlete_path(@athlete)
  end

  def show

  end
end