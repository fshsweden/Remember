class AddCartStuff < ActiveRecord::Migration
  def change

	  create_table :carts do |t|
		  t.timestamps
		  t.date     "purchased_at"
	  end

	  create_table :cart_items do |t|
		  t.references :cart
		  t.references :product
		  t.integer :qty
		  t.float :price

		  t.timestamps
	  end

  end
end
