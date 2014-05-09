FactoryGirl.define do
  factory :hotel do
    title {Faker::Company.name}
    star_rating '3'
    breakfast_included '1'
    room_description {Faker::Lorem.sentence}
    price_for_room 100.0
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'factories','image.png')) }
    address_attributes {attributes_for(:address)}
  end
end

