class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :comment
      t.belongs_to :person

      t.timestamps
    end
  end
end
