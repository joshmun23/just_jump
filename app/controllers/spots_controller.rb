class SpotsController < ApplicationController
  def index
    @spot = Spot.new
  end

  def new
    #curl commands? within ruby code
    # cmd = "as;dfkjsadl;kfa"
    # `#{}cmd`
  end

  def create

    redirect_to spots_path
  end

  private

  def spot_params
    # params.require(:spot).permit(:will_eat)
  end

  def find_spot

  end
end
