require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :user => nil,
      :description => "MyText",
      :price => 1,
      :image_data => "MyText"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[user_id]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[price]"

      assert_select "textarea[name=?]", "item[image_data]"
    end
  end
end
