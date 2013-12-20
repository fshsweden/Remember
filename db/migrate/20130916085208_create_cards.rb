class CreateCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.references :user
      t.string :cc_type
      t.string :cc_number
      t.string :cc_cvc
      t.string :cc_exp_month
      t.string :cc_exp_year
      t.string :cc_name

      t.timestamps
    end
    add_index :cards, :user_id
  end
end
