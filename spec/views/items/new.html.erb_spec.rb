require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :user => nil,
      :description => "MyText",
      :price => 1,
      :image_data => "MyText"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[user_id]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[price]"

      assert_select "textarea[name=?]", "item[image_data]"
    end
  end
end
