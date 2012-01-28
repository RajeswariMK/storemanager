FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) {|n| "rajes#{n}@gmail.com" }
    u.password "spritle"
    u.password_confirmation "spritle"
  end
end
