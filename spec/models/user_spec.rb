require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { described_class.new(
    name: 'test_name',
    email: "test@test.com",
    password: "123456"
  )}

  it "is valid with a valid username and password" do
    p subject
    expect(subject).to be_valid 
  end 

  it "is not valid without an email with an @" do
    expect(subject.email).to include("@")
  end

end