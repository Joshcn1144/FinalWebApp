require 'rails_helper'

RSpec.describe "Owners", type: :system do
  context "Happy Path: Create a new owner" do
    it "creates a new owner successfully" do
      visit new_owner_path

      fill_in "Email", with: "johndoe@example.com"
      fill_in "Password", with: "password"
      click_button "New Owner"

      expect(page).to have_content("Owner was successfully created.")
    end
  end

  context "Sad Path: Unsuccessful owner creation" do
    it "displays an error message when email is blank" do
      visit new_owner_path

      fill_in "Password", with: "password"
      click_button "New Owner"

      expect(page).to have_content("Email can't be blank")
    end
  end
end

RSpec.describe "Login", type: :system do
  before do
    # Create a test owner
    @owner = Owner.create!(name: "Test Owner", email: "owner@example.com", password: "password")
  end

  context "Happy Path: Login Successful" do
    it "logs in the owner and redirects to the dashboard" do
      visit owner_path

      fill_in "Email", with: "owner@example.com"
      fill_in "Password", with: "password"
      click_button "Log In"

      expect(page).to have_current_path(owner_path)
      expect(page).to have_content("Welcome, Test Owner")
      expect(page).to have_content("Manage Menu Items")
    end
  end

  context "Sad Path: Incorrect Login" do
    it "displays an error message for invalid login" do
      visit owner_path

      fill_in "Email", with: "wrong@example.com"
      fill_in "Password", with: "wrongpassword"
      click_button "Log In"

      expect(page).to have_current_path(owner_path)
      expect(page).to have_content("Invalid username or password")
    end
  end
end
