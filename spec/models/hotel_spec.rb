require 'spec_helper'

describe Hotel do
	it "has a valid factory" do
		expect(create(:hotel)).to be_valid
	end
	it "is invalid without title" do
		hotel = build(:hotel, :title => nil)
		expect(hotel).not_to be_valid
 	end
	it "is invalid if star rating is not in range from 1 to 5" do
		hotel = build(:hotel, :star_rating => "6")
		expect(hotel).not_to be_valid
 	end
	it "is invalid without photo" do
		hotel = build(:hotel, :photo => nil)
		expect(hotel).not_to be_valid
	end
	it "is invalid without address" do
		hotel = build(:hotel)
		hotel.address.city = nil
		expect(hotel).not_to be_valid
	end
	it "shows ratings for hotel" do
		hotel = create(:hotel)
		ratings = [Rating.new(:rate => 3), Rating.new(:rate => 1)]
		hotel.ratings = ratings
		expect(hotel.ratings.count).to eq 2
		expect(hotel.average_rate).to eq 2.0
	end
	it "shows top 5 hotels" do
		pending
	end
end
