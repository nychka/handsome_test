class RatingsController < ApplicationController
  before_action :set_hotel, :only => [:index, :create]
  def index
  end
  def create
    rating = Rating.new(:user_id => current_user.id, :rate => ratings_params[:rate])
    @hotel.ratings << rating
    respond_to do |format|
      format.html { redirect_to @hotel, :notice => 'Hotel rating was successfully added.' }
    end
  end
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end
    def ratings_params
      params.require(:rating).permit(:rate)
    end
end
