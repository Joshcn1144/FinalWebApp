require 'rails_helper'

RSpec.describe "menu_items/edit", type: :view do
  let(:menu_item) {
    MenuItem.create!(
      name: "MyString",
      price: "9.99",
      description: "MyText",
      available: false,
      base_menu: nil
    )
  }

  before(:each) do
    assign(:menu_item, menu_item)
  end

  it "renders the edit menu_item form" do
    render

    assert_select "form[action=?][method=?]", menu_item_path(menu_item), "post" do

      assert_select "input[name=?]", "menu_item[name]"

      assert_select "input[name=?]", "menu_item[price]"

      assert_select "textarea[name=?]", "menu_item[description]"

      assert_select "input[name=?]", "menu_item[available]"

      assert_select "input[name=?]", "menu_item[base_menu_id]"
    end
  end
end
