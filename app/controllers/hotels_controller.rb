class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.top(5)
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    rating = current_user.rated_hotel? @hotel.id
    @comment = Comment.new
     # якщо користувач уже оцінив готель
    if(rating)
      # виводимо поточний рейтинг
      @rating = rating
    else
      # створюємо новий і передаємо у форму
      @rating = Rating.new(:user_id => current_user.id)
    end 
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @hotel.address = Address.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hotel }
      else
        format.html { render action: 'new' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      p hotel_params
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:title, :star_rating, :breakfast_included,
          :room_description, :photo, :price_for_room, :address_attributes => [:id, :country, :state, :city, :street])
    end
end
