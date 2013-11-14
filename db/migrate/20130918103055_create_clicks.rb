class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks, :id => :false do |t|
      t.integer :person_id
      t.integer :count
    end
    add_index :clicks, [:person_id]
  end
end
