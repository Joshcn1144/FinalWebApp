require 'rails_helper'

RSpec.describe "menu_items/show", type: :view do
  before(:each) do
    assign(:menu_item, MenuItem.create!(
      item: "Item",
      description: "MyText",
      price: "9.99",
      available: false,
      base_menu: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
