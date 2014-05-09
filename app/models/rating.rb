class Rating
  include Mongoid::Document
  field :rate, :type => Integer
  field :user_id, :type => BSON::ObjectId
  
  belongs_to :hotel
  validates_presence_of :rate
  validates_numericality_of :rate, :greater_than => 0, :less_than_or_equal_to => 5
end