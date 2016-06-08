FactoryGirl.define do
  factory :token do
    access_token { FFaker::Guid }
    expires { Time.now + 1.day }
    user
  end


end
