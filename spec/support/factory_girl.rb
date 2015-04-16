require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    # factory :user_with_photo do
    #   profile_photo { Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/reel.jpeg") }
    # end
  end
end
