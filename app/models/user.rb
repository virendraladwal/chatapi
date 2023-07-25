class User < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "name", "image", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :booking_details
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  

end
