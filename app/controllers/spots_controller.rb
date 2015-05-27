class SpotsController < ApplicationController
  def index
    @spot = Spot.new
  end

  def new
  end

  def create

    redirect_to spots_path
  end

  private

  def spot_params
  end

  def find_spot

  end
end
