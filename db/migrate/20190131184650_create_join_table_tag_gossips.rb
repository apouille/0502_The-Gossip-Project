class CreateJoinTableTagGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_tag_gossips do |t|

      t.timestamps
    end
  end
end
