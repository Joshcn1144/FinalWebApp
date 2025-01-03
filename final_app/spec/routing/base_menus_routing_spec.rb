require "rails_helper"

RSpec.describe BaseMenusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/base_menus").to route_to("base_menus#index")
    end

    it "routes to #new" do
      expect(get: "/base_menus/new").to route_to("base_menus#new")
    end

    it "routes to #show" do
      expect(get: "/base_menus/1").to route_to("base_menus#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/base_menus/1/edit").to route_to("base_menus#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/base_menus").to route_to("base_menus#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/base_menus/1").to route_to("base_menus#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/base_menus/1").to route_to("base_menus#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/base_menus/1").to route_to("base_menus#destroy", id: "1")
    end
  end
end
