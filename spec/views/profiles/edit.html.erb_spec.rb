require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :avatar_data => "MyText",
      :about_me => "MyText",
      :first_name => "MyString",
      :last_name => "MyString",
      :username => "MyString",
      :user => nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "textarea[name=?]", "profile[avatar_data]"

      assert_select "textarea[name=?]", "profile[about_me]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[username]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
