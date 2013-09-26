class RemoveUserIdFromClicks < ActiveRecord::Migration
  def up
    remove_column :clicks, :user_id
  end

  def down
    add_column :clicks, :user_id, :integer
  end
end
