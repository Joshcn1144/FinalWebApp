require 'rails_helper'

RSpec.describe "base_menus/show", type: :view do
  before(:each) do
    assign(:base_menu, BaseMenu.create!(
      title: "Title",
      description: "MyText",
      owner: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
