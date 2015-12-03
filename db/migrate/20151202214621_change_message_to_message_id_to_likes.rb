class ChangeMessageToMessageIdToLikes < ActiveRecord::Migration
  def change
    rename_column :likes, :message, :message_id
  end
end
