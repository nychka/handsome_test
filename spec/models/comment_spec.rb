require 'spec_helper'

describe Comment do
	it "is valid" do
		comment = Comment.new(:comment => "test comment", :user_id => '534e2f786e796316c3000000')
		expect(comment).to be_valid
	end
	it "is invalid with comment" do
		comment = Comment.new
		expect(comment).not_to be_valid
	end
	it "is invalid with user id" do
		comment = Comment.new(:comment => "test comment", :user_id => nil)
		expect(comment).not_to be_valid
	end
end
