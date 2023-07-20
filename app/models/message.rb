class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  def self.ransackable_attributes(auth_object = nil)
    ["content", "conversation_id", "created_at", "id", "updated_at", "user_id"]
  end
end
