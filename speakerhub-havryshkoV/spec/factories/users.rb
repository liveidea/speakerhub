FactoryGirl.define do
  factory :user do
    f_name             "Vova"
    l_name             "Gula"
    sequence(:email)   { |i| "user#{i}@email.com" }
    password           "user12345"
    encrypted_password User.new.send(:password_digest, "user12345")
  end
end
