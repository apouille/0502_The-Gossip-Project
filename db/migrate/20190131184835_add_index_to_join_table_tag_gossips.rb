class AddIndexToJoinTableTagGossips < ActiveRecord::Migration[5.2]
  def change
  	add_reference :join_table_tag_gossips, :gossip, foreign_key: true
    add_reference :join_table_tag_gossips, :tag, foreign_key: true
  end
end
