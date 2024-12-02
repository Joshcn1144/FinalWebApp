require 'rails_helper'

RSpec.describe "base_menus/new", type: :view do
  before(:each) do
    assign(:base_menu, BaseMenu.new(
      title: "MyString",
      description: "MyText",
      owner: nil
    ))
  end

  it "renders new base_menu form" do
    render

    assert_select "form[action=?][method=?]", base_menus_path, "post" do

      assert_select "input[name=?]", "base_menu[title]"

      assert_select "textarea[name=?]", "base_menu[description]"

      assert_select "input[name=?]", "base_menu[owner_id]"
    end
  end
end
