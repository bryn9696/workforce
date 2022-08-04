require 'rails_helper'

RSpec.describe Organisation, type: :model do
  subject { Organisation.new(name: "Bob's Burgers", hourly_rate: 10)}
    it "organisation name should be present" do
      user = User.new(
        name: 'test_name',
        email: "test@test.com",
        password: "123456")
      expect(subject).not_to be_nil
    end

    it "rate should allow valid values" do
      subject.hourly_rate = 15
      expect(subject).to be_valid
    end

    it "prevents a user from submitting an organisation without a name" do
      organisation = Organisation.new(name: "", hourly_rate: 10)
      expect(organisation).to_not be_valid
    end   

    it "prevents a user from submitting an organisation without an hourly_rate" do
      organisation = Organisation.new(name: "Bob's Burgers", hourly_rate: "")
      expect(organisation).to_not be_valid
    end   
end
