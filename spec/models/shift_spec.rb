require 'rails_helper'

RSpec.describe Shift, type: :model do
  user = User.new(name: 'user_one',
  email: "test@test.com",
  password: "123456")

  subject { Shift.new(user: user, full_name: "bryn williams", shift_date: "02/12/2022", start_time: "11:00", finish_time: "12:00", break_length: 5)}
  it "is valid with all fields filled" do
    p subject
    expect(subject).to be_valid 
  end 

  it "prevents a user from submitting an empty shift" do
    shift = Shift.new(user: user, full_name: "", shift_date: "", start_time: "", finish_time: "", break_length: 5)
    expect(shift).to_not be_valid
  end 

  it "prevents a user from submitting a shift with no name" do
    shift = Shift.new(user: user, full_name: "", shift_date: "02/12/2022", start_time: "11:00", finish_time: "12:00", break_length: 5)
    expect(shift).to_not be_valid
  end 

  it "prevents a user from submitting a shift with date" do
    shift = Shift.new(user: user, full_name: "bryn", shift_date: "", start_time: "11:00", finish_time: "12:00", break_length: 5)
    expect(shift).to_not be_valid
  end   

  it "prevents a user from submitting a shift with no start time" do
    shift = Shift.new(user: user, full_name: "bryn", shift_date: "02/12/2022", start_time: "", finish_time: "12:00", break_length: 5)
    expect(shift).to_not be_valid
  end 

  it "prevents a user from submitting a shift with no end time" do
    shift = Shift.new(user: user, full_name: "bryn", shift_date: "02/12/2022", start_time: "11:00", finish_time: "", break_length: 5)
    expect(shift).to_not be_valid
  end 
end
