class Organisation < ApplicationRecord
  has_many :users 
  has_many :shifts 

  validates :name, :presence => true 
  validates :hourly_rate, :presence => true 
  attr_accessor :organisation 

end
