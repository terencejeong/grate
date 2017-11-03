require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :avatar_data => "MyText",
        :about_me => "MyText",
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :user => nil
      ),
      Profile.create!(
        :avatar_data => "MyText",
        :about_me => "MyText",
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :user => nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
