FactoryGirl.define do
  factory :user do |user|
    user.sequence(:email) { |n| "arnis.lapsa#{n}@gmail.com" }
    password '1213123'
  end

  factory :ticket do
    title 'unable to dual-boot windows and linux'
    description \
      <<-description
      forgot to backup boot partition, formatted it

      installed linux, unable to repair windows BCD
      description
  end

  factory :owned_ticket, parent: :ticket do
    user
  end
end
