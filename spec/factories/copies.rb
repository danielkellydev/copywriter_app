FactoryBot.define do
    factory :copy do
      business_name { "MyBusiness" }
      industry { "Technology" }
      target_market { "Young Adults" }
      copy_location { "Homepage" }
      copy_purpose { "Introduction" }
      copy_tone { "Friendly" }
      association :user   # Uncomment this if a copy belongs to a user
    end
  end