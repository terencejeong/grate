require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :avatar_data => "MyText",
      :about_me => "MyText",
      :first_name => "MyString",
      :last_name => "MyString",
      :username => "MyString",
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "textarea[name=?]", "profile[avatar_data]"

      assert_select "textarea[name=?]", "profile[about_me]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[username]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
