class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.belongs_to :user
      t.integer :person_id
      t.datetime :when

      t.timestamps
    end
    add_index :histories, :user_id
  end
end
