class Tag < ApplicationRecord
	has_many :join_table_tag_gossips, dependent: :destroy
	has_many :gossips, through: :join_table_tag_gossips, dependent: :destroy

	validates :title,
	presence: true
end
