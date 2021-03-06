require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:id) {|n| n }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :listing do
      sequence(:street) {|n| "#{n} Main St" }
      sequence(:unit) {|n| "#{n}A" }
      city { "Schenectady" }
      state { "NY" }
      zip { "13820" }
      sequence(:latitude) {|n| "42.44947#{n}" }
      sequence(:longitude) {|n| "-75.06569#{n}" }
      user
    end

  factory :amenity do
    building_style { "duplex" }
    parking_spaces { "2" }
    pets { "false" }
    zoning { "residential" }
    school_district { "central" }
    heating { "gas" }
    cooling { "central air" }
    hud { "false" }
    smoking { "false" }
    listing
  end

  factory :feature do
      sequence(:bedrooms) {|n| "#{n}" }
      sequence(:bathrooms) {|n| "#{n}" }
      sequence(:rent) {|n| "#{n}00" }
      date_available { "2019-03-03" }
      sequence(:lease_length) {|n| "#{n}" }
      sequence(:sq_ft) {|n| "#{n}000" }
      listing
    end

  factory :picture do
      image {"https://s3.amazonaws.com/hom-development/Screen+Shot+2019-02-05+at+8.19.50+PM.png"}
      listing
    end
 end
