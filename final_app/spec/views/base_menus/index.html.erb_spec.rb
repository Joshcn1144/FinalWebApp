require 'rails_helper'

RSpec.describe "base_menus/index", type: :view do
  before(:each) do
    assign(:base_menus, [
      BaseMenu.create!(
        title: "Title",
        description: "MyText",
        owner: nil
      ),
      BaseMenu.create!(
        title: "Title",
        description: "MyText",
        owner: nil
      )
    ])
  end

  it "renders a list of base_menus" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
