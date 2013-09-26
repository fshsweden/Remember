class AddTimestampsToPersons < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.timestamps
    end
  end
end
