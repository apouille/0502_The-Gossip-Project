class User < ApplicationRecord
	belongs_to :city, dependent: :destroy
	has_many :gossips, dependent: :destroy
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "Message", dependent: :destroy
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "Message", dependent: :destroy

	validates :first_name,
	presence: true

	validates :last_name,
	presence: true

	validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :age,
  presence: true

  validates :description,
  presence: true
   
end
