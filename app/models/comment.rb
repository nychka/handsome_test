class Comment
  include Mongoid::Document
  field :comment, type: String
  field :user_id, type: BSON::ObjectId
  
  validates :comment, :presence => true
  validates :user_id, :presence => true
  embedded_in :hotel
end
