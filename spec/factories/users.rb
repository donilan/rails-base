FactoryGirl.define do
  factory :user do
    sequence(:username){|n| "user#{n}" }
    confirmed_at Time.zone.now
    password 'whatever'
    password_confirmation 'whatever'
  end
end
