class CreateUpdateActions < ActiveRecord::Migration
  def change
    create_table :update_actions do |t|
      t.belongs_to :person
      t.string :comment
      t.timestamps
    end
  end
end