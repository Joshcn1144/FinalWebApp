require 'rails_helper'

RSpec.describe "base_menus/edit", type: :view do
  let(:base_menu) {
    BaseMenu.create!(
      title: "MyString",
      description: "MyText",
      owner: nil
    )
  }

  before(:each) do
    assign(:base_menu, base_menu)
  end

  it "renders the edit base_menu form" do
    render

    assert_select "form[action=?][method=?]", base_menu_path(base_menu), "post" do

      assert_select "input[name=?]", "base_menu[title]"

      assert_select "textarea[name=?]", "base_menu[description]"

      assert_select "input[name=?]", "base_menu[owner_id]"
    end
  end
end
