class AddDiscussionIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :discussion_id, :int
  end
end
