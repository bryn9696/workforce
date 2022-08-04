class Shift < ApplicationRecord
  belongs_to :user

  validates :full_name, :presence => true 
  validates :shift_date, :presence => true 
  validates :start_time, :presence => true
  validates :finish_time, :presence => true 

end
