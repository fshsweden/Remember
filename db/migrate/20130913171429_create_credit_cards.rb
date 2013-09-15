class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.belongs_to :user
      t.string :cc_number
      t.string :cc_cvc
      t.string :cc_exp_year
      t.string :cc_exp_month
      t.string :cc_name
      t.string :cc_type

      t.timestamps
    end
    add_index :credit_cards, :user_id
  end
end
