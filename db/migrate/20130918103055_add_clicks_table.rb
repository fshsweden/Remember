class AddClicksTable < ActiveRecord::Migration
  def change
    create_table :clicks, :id => :false do |t|
      t.integer :user_id
      t.integer :person_id
    end
    add_index :clicks, [:user_id, :person_id]
  end
end
