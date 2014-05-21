require 'spec_helper'

feature "User's authorization" do
	
	scenario "user signs in", :js => false do
		login_user
		expect(page).to have_content 'Добавити готель'
	end
end
