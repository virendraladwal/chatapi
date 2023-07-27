FactoryBot.define do
    factory :message do
      association :user
      association :conversation
      body { "This is a sample message." }
    end
end
  