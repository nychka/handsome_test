require 'spec_helper'

describe Address do
	before :each do
		@hotel = build(:hotel)
	end
	it "is a valid factory" do
		expect(@hotel.address).to be_valid
	end
	it "is invalid with country" do
		#address = build(:address, :country => nil)
		@hotel.address.country = nil
		expect(@hotel.address).not_to be_valid
	end
	it "is invalid with state" do
                #-address = build(:address, :state => nil)
		@hotel.address.state = nil
                expect(@hotel.address).not_to be_valid
        end
	it "is invalid with city" do
                #address = build(:address, :city => nil)
		@hotel.address.city = nil
                expect(@hotel.address).not_to be_valid
        end
	it "is invalid with street" do
                #address = build(:address, :street => nil)
		@hotel.address.street = nil
                expect(@hotel.address).not_to be_valid
        end	
end
