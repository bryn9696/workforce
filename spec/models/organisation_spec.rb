require 'rails_helper'

RSpec.describe Organisation, type: :model do
  subject { Organisation.new(name: "Bob's Burgers", hourly_rate: 10)}
    it "organisation name should be present" do
      expect(subject).not_to be_nil
    end

    it "rate should allow valid values" do
      subject.hourly_rate = 15
      expect(subject).to be_valid
    end
end
