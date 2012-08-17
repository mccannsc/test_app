FactoryGirl.define do
  factory :user do                  # By passing the :user to the factory command we tell FactoryGirl this is a definition for the User model
    sequence(:name)     { |n| "Person #{n}" }
    sequence(:email)    { |n| "person_#{n}@example.com" }
    password  "foobar"
    password_confirmation "foobar"
    
    factory :admin do             # This creates an admin user in our tests. 
      admin true
    end
  end
end