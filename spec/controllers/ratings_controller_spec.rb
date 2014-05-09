require 'spec_helper'

describe RatingsController do
  before :each do
    login_user
  end
  it "POST /hotels/:id/ratings" do
    hotel = create(:hotel)
    params = {:rating => {:rate => 4}, :hotel_id => hotel.id}
    post :create, params
    expect(response).to redirect_to hotel
  end
end

