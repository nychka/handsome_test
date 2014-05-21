class Comment
  include Mongoid::Document
  field :comment, type: String
  field :user_id, type: BSON::ObjectId
  
  validates :comment, presence: true, length: {minimum: 3, maximum: 160}
  validates :user_id, presence: true
  embedded_in :hotel
  def user
  	user = User.find(self.user_id)
  	user.email
  end
end
