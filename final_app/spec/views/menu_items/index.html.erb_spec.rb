require 'rails_helper'

RSpec.describe "menu_items/index", type: :view do
  before(:each) do
    assign(:menu_items, [
      MenuItem.create!(
        name: "Name",
        price: "9.99",
        description: "MyText",
        available: false,
        base_menu: nil
      ),
      MenuItem.create!(
        name: "Name",
        price: "9.99",
        description: "MyText",
        available: false,
        base_menu: nil
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
