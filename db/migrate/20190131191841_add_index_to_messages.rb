class AddIndexToMessages < ActiveRecord::Migration[5.2]
  def change
  	add_reference :messages, :recipient, index: true
  	add_reference :messages, :sender, index: true
  end
end
