require 'rails_helper'

RSpec.describe Owner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  Rspec.describe Owner
  # POST /students (create)
  describe "POST /owners" do
    context "with valid parameters" do
      it "returns a 201 status when the owner is successfully created" do
        post owners_path, params: { owner: { company_name: "Restuarant", name: "Josh", email: "john@example.com" } }
        expect(response).to have_http_status(:found)  # Expect redirect after creation
      end
    end
    describe "validations" do
      it "is valid with valid attributes" do
        owner = build(:owner, name: "John Doe", email: "john.doe@example.com")
        expect(owner).to be_valid
      end
  
      it "is invalid without a name" do
        owner = build(:owner, name: nil)
        expect(owner).not_to be_valid
        expect(owner.errors[:name]).to include("can't be blank")
      end
  
      it "is invalid without an email" do
        owner = build(:owner, email: nil)
        expect(owner).not_to be_valid
        expect(owner.errors[:email]).to include("can't be blank")
      end
    end
end
