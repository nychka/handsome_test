
class Hotel
  include Mongoid::Document
  field :title, type: String
  field :star_rating, type: Integer
  field :breakfast_included, type: Mongoid::Boolean
  field :room_description, type: String
  field :photo, type: String
  field :price_for_room, type: Float
  
  mount_uploader :photo, ImageUploader
  
  embeds_one :address
  has_many :ratings
  embeds_many :comments
  
  validates_presence_of :title
  validates :star_rating, presence: true, numericality: { gteater_than: 0, less_than_or_equal_to: 5}
  validates_associated :address
  validates_presence_of :photo
  validate :photo_size_validation
  accepts_nested_attributes_for :address
  
  # масив рейтингів
  def rates
     entries = Rating.where(:hotel_id => self.id).entries
     entries.map{|rating| rating.rate}  unless entries.nil?
  end
  # визначає середній рейтинг
  def average_rate
    (rates.empty?) ? 0 : (rates.inject(:+).to_f / rates.size)
  end
  # вибирає найкращі N готелів
  def self.top(number)
    Hotel.all.sort_by{|obj|obj.average_rate}.last(number).reverse
  end
  validate :photo_size_validation
 
  private
 
  def photo_size_validation
    errors[:photo] << "should be less than 2MB" if photo.size > 2.megabytes
  end
end
