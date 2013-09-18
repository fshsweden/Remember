class AddClickcountToClicks < ActiveRecord::Migration
  def change
    change_table :clicks do |t|
      t.integer :count
    end
  end
end
