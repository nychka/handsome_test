require 'spec_helper'

feature "User's authorization", :type => :feature do
	
	before :each do
		#@user = create(:user)
  end	

	scenario "user signs in", :js => false do
		login_user
		expect(page).to have_content 'Listing hotels'
	end
end
