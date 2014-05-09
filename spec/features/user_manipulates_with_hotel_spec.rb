require 'spec_helper'

feature "User manipulates with hotel" do
  
  before :each do
    login_user
  end
  scenario "user creates new hotel", :js => false do
    create_hotel
    expect(page).to have_content 'Hotel was successfully created.'
  end
  
  scenario "user sees hotel", :js => false do
    create_hotel
    visit hotels_path
    click_link 'Show'
    expect(page).to have_content 'New comment'
    click_link 'Back'
    expect(page).to have_content 'Listing hotels'
  end
  
  scenario "user edits hotel", :js => false do
    hotel = build(:hotel)
    address = build(:address)
    create_hotel
    visit hotels_path
    click_link 'Edit'
    within(".edit_hotel") do
			fill_in 'hotel_title', :with => hotel.title
      select hotel.star_rating, :from => "hotel_star_rating"
      check 'hotel_breakfast_included'
      fill_in 'hotel_room_description', :with => hotel.room_description
      fill_in 'hotel_price_for_room', :with => hotel.price_for_room
      attach_file('hotel_photo', File.join(Rails.root, 'spec', 'factories','image.png'))
      fill_in 'hotel_address_attributes_country', :with => address.country
      fill_in 'hotel_address_attributes_state', :with => address.state
      fill_in 'hotel_address_attributes_city', :with => address.city
      fill_in 'hotel_address_attributes_street', :with => address.street
		end
    click_on "Update Hotel"
    expect(page).to have_content 'Hotel was successfully updated.'
  end
  
  scenario "user destroys hotel", :js => true do
    create_hotel
    visit hotels_path
    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Listing hotels'
  end
end
