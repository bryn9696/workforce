require 'rails_helper'

RSpec.describe Shift, type: :model do
  subject { Shift.new(shift_date: "02/12/2022", start_time: "11:00", finish_time: "12:00", break_length: 5)}
  it "is valid with all fields filled" do
    p subject
    expect(subject).to be_valid 
  end 

end
