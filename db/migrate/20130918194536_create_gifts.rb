class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts, :id => :false do |t|
      t.integer :person_id
      t.integer :product_id
      t.string :comment
      t.timestamps
    end
  end
end
