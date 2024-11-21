FactoryBot.define do
    factory(:owner) do
      company_name { Faker::Name.company_name }
      name { Faker::Name.name }
      email { "owner1@msudenver.edu" }
      password { "password" }
      password_confirmation { "password" }
    end
   end
   