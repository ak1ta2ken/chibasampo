FactoryBot.define do
  factory :user do
    name { "user" }
    email { "user@com" }
    password { "password" }
  end

  factory :second_user, class: User do
    name { "second_user" }
    email { "second_user@com" }
    password { "password" }
  end
end
