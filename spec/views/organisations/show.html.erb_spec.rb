require 'rails_helper'

RSpec.describe "organisations/show", type: :view do
  before(:each) do
    @organisation = assign(:organisation, Organisation.create!(
      name: "Name",
      hourly_rate: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
