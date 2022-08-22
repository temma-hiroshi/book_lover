FactoryBot.define do
  factory :user do
    name { "testuser" }
    email { "testuser@test.org" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
