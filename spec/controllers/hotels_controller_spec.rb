require 'spec_helper'

describe HotelsController do
  before :each do
    login_user
  end
  it "GET /hotels" do
      get :index
      expect(response.status).to eq 200
  end
  it "GET /hotels/new" do
      get :new
      expect(response.status).to eq 200
  end
  it "POST /hotels and changes hotels count by 1" do
     expect{ post :create, :hotel => attributes_for(:hotel)}.to change(Hotel,:count).by(1)
  end
  it "POST /hotels and redirects to the last hotel" do
     post :create, :hotel => attributes_for(:hotel) 
     expect(response).to redirect_to Hotel.last
  end
  it "POST /hotels with invalid params" do
     hotel = attributes_for(:hotel)
     hotel[:star_rating] = false # expect from 1 to 5
     expect(response).not_to redirect_to Hotel.last
     expect{ post :create, :hotel => hotel}.not_to change(Hotel,:count)
  end  
  it "GET /hotels/:id" do
    hotel = create(:hotel)
    get :show, id: hotel
    expect(response.status).to eq 200
  end
  it "GET /hotels/:id/edit" do
    hotel = create(:hotel)
    get :edit, id: hotel
    expect(response.status).to eq 200
  end
  it "PATCH /hotels/:id" do
    hotel = create(:hotel)
    updated_hotel = attributes_for(:hotel)
    updated_hotel[:title] = "Updated hotel"
    updated_hotel[:star_rating] = 5
    patch :update, :id => hotel, hotel: updated_hotel
    expect(response).to redirect_to hotel
  end
  it "PUT /hotels/:id" do
    hotel = create(:hotel)
    updated_hotel = attributes_for(:hotel)
    updated_hotel[:title] = "Updated hotel"
    updated_hotel[:star_rating] = 5
    put :update, :id => hotel, hotel: updated_hotel
    expect(response).to redirect_to hotel
  end
  it "DELETE /hotels/:id" do
     hotel = create(:hotel)
     expect{delete :destroy, id: hotel}.to change(Hotel, :count).by(-1)
     expect(response).to redirect_to hotels_path
  end
end
