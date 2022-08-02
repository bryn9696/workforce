require 'rails_helper'

RSpec.describe "shifts/index", type: :view do
  before(:each) do
    assign(:shifts, [
      Shift.create!(
        break_length: 2
      ),
      Shift.create!(
        break_length: 2
      )
    ])
  end

  it "renders a list of shifts" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
