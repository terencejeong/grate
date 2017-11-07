require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
      Offer.create!(
        :user => nil,
        :profile => nil
      ),
      Offer.create!(
        :user => nil,
        :profile => nil
      )
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
