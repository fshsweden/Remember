# SQLEditor export: Rails Migration
# id columns are removed
ActiveRecord::Schema.define(:version => 2013125883) do

  create_table :actions do |t|
    t.references :people
    t.string :comment, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :authentications do |t|
    t.references :users
    t.string :provider, :limit => 255
    t.string :uid, :limit => 255
    t.string :token, :limit => 255
    t.string :token_secret, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :cart_items do |t|
    t.integer :person_id
    t.references :carts
    t.integer :product_id
    t.integer :qty
    t.float :price
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :carts do |t|
    t.datetime :created_at
    t.datetime :updated_at
    t.datetime :purchased_at
    t.references :users
  end

  create_table :categories do |t|
    t.string :name, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :categories_products do |t|
    t.references :categories
    t.references :products
  end

  create_table :clicks do |t|
    t.references :people
    t.integer :count
  end

  create_table :credit_cards do |t|
    t.references :users
    t.string :cc_number, :limit => 255
    t.string :cc_cvc, :limit => 255
    t.string :cc_exp_year, :limit => 255
    t.string :cc_exp_month, :limit => 255
    t.string :cc_name, :limit => 255
    t.string :cc_type, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :events do |t|
    t.string :name, :limit => 255
    t.string :date, :limit => 255
    t.string :comment, :limit => 255
    t.references :people
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :gifts do |t|
    t.references :people
    t.references :products
    t.string :comment, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
    t.integer :users_id
  end

  create_table :people do |t|
    t.string :name, :limit => 50
    t.string :surname, :limit => 50
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :people_users, :id => false do |t|
    t.references :people
    t.references :users
  end

  create_table :person_places do |t|
    t.integer :person_id
    t.references :places
  end

  create_table :photos do |t|
    t.string :title, :limit => 255
    t.string :description, :limit => 255
    t.string :location, :limit => 255
    t.references :people
    t.datetime :created_at
    t.datetime :updated_at
    t.string :image_file_name, :limit => 255
    t.string :image_content_type, :limit => 255
    t.integer :image_file_size
    t.datetime :image_updated_at
  end

  create_table :places do |t|
    t.string :description, :limit => 255
  end

  create_table :products do |t|
    t.string :name, :limit => 255
    t.integer :category_id
    t.datetime :created_at
    t.datetime :updated_at
    t.float :price
  end

  create_table :schema_migrations, :id => false do |t|
    t.string :version, :limit => 255, :null => false
  end

  create_table :sqlite_sequence, :id => false do |t|
    t.integer :name
    t.integer :seq
  end

  create_table :stories do |t|
    t.references :people
    t.string :title, :limit => 255
    t.text :content
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :users do |t|
    t.string :username, :limit => 255
    t.string :email, :limit => 255
    t.string :encrypted_password, :limit => 255
    t.string :reset_password_token, :limit => 255
    t.datetime :reset_password_sent_at
    t.datetime :remember_created_at
    t.integer :sign_in_count
    t.datetime :current_sign_in_at
    t.datetime :last_sign_in_at
    t.string :current_sign_in_ip, :limit => 255
    t.string :last_sign_in_ip, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :yard_locations do |t|
    t.references :places
    t.references :yards
  end

  create_table :yards do |t|
    t.integer :lat
    t.integer :lng
    t.string :name, :limit => 255
  end

end
