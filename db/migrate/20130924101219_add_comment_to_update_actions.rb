class AddCommentToUpdateActions < ActiveRecord::Migration
  def change
    change_table :update_actions do |t|
      t.string :comment
    end
  end
end
