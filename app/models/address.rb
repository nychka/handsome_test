class Address
  include Mongoid::Document

  field :country, type: String
  field :state, type: String
  field :city, type: String
  field :street, type: String

  embedded_in :hotel, :inverse_of => :address
  validates :country, :presence => true
  validates :state, :presence => true
  validates :city, :presence => true
  validates :street, :presence => true
end
