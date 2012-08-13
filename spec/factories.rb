FactoryGirl.define do
  factory :user do                  # By passing the :user to the factory command we tell FactoryGirl this is a definition for the User model
    name  "Michael Hartl"
    email "michael@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end