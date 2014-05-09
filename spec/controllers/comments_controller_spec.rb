require 'spec_helper'

describe CommentsController do
  before :each do
    login_user
  end
  it "POST /hotels/:id/comments" do
    hotel = create(:hotel)
    params = {:comment => {:comment => "This is a test comment"}, :hotel_id => hotel.id}
    post :create, params
    expect(response).to redirect_to hotel
  end
end

