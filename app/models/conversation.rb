class Conversation < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "recipient_id", "sender_id", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["messages", "recipient", "sender"]
  end 
  def self.between(sender_id, recipient_id)
    where('(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)',
          sender_id, recipient_id, recipient_id, sender_id)
  end
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
    has_many :messages, dependent: :destroy
    validates_uniqueness_of :sender_id, scope: :recipient_id
    # scope :between, -> (sender_id, recipient_id) do 
    #   where("(conversations.sender_id = ? AND   conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
    # end

end

