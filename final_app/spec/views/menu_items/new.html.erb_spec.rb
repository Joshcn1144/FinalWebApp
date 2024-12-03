require 'rails_helper'

RSpec.describe "menu_items/new", type: :view do
  before(:each) do
    assign(:menu_item, MenuItem.new(
      item: "MyString",
      description: "MyText",
      price: "9.99",
      available: false,
      base_menu: nil
    ))
  end

  it "renders new menu_item form" do
    render

    assert_select "form[action=?][method=?]", menu_items_path, "post" do

      assert_select "input[name=?]", "menu_item[item]"

      assert_select "textarea[name=?]", "menu_item[description]"

      assert_select "input[name=?]", "menu_item[price]"

      assert_select "input[name=?]", "menu_item[available]"

      assert_select "input[name=?]", "menu_item[base_menu_id]"
    end
  end
end
