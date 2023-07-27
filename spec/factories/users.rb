FactoryBot.define do
    factory :user do
      name { "virendra" }
      image { nil }
      email { Faker::Internet.email }
      password { "123456" }
      end
  end