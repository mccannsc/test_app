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
  
  factory :micropost do       # This is a factory for microposts. 
    content "Lorem ipsum"
    user                        # This tells Factor Girl about the microposts associated user. 
  end
end