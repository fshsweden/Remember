# SQLEditor export: Rails Migration
# id columns are removed
ActiveRecord::Schema.define(:version => 2013112595712) do

  create_table :BLOGS do |t|
    t.string :title, :limit => 255
    t.text :content
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :CARDS do |t|
    t.integer :user_id
    t.string :cc_type, :limit => 255
    t.string :cc_number, :limit => 255
    t.string :cc_cvc, :limit => 255
    t.string :cc_exp_month, :limit => 255
    t.string :cc_exp_year, :limit => 255
    t.string :cc_name, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :CART_ITEMS do |t|
    t.references :PEOPLE
    t.references :CARTS
    t.integer :product_id
    t.integer :qty
    t.float :price
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :CARTS do |t|
    t.datetime :created_at
    t.datetime :updated_at
    t.datetime :purchased_at
    t.references :USERS
  end

  create_table :CATEGORIES do |t|
    t.string :name, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :EVENTS do |t|
    t.string :name, :limit => 255
    t.string :date, :limit => 255
    t.string :comment, :limit => 255
    t.references :PEOPLE
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :HISTORIES do |t|
    t.integer :user_id
    t.integer :person_id
    t.datetime :when
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :PEOPLE do |t|
    t.string :name, :limit => 50
    t.string :surname, :limit => 50
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :CLICKS do |t|
    t.references :PEOPLE
    t.integer :count
  end

  create_table :PHOTOS do |t|
    t.string :title, :limit => 255
    t.string :description, :limit => 255
    t.string :location, :limit => 255
    t.references :PEOPLE
    t.datetime :created_at
    t.datetime :updated_at
    t.string :image_file_name, :limit => 255
    t.string :image_content_type, :limit => 255
    t.integer :image_file_size
    t.datetime :image_updated_at
  end

  create_table :PRODUCTS do |t|
    t.string :name, :limit => 255
    t.integer :category_id
    t.datetime :created_at
    t.datetime :updated_at
    t.float :price
  end

  create_table :CATEGORIES_PRODUCTS do |t|
    t.references :CATEGORIES
    t.references :PRODUCTS
  end

  create_table :GIFTS do |t|
    t.references :PEOPLE
    t.references :PRODUCTS
    t.string :comment, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :RAILS_ADMIN_HISTORIES do |t|
    t.text :message
    t.string :username, :limit => 255
    t.integer :item
    t.string :table, :limit => 255
    t.integer :month, :limit => 2
    t.integer :year, :limit => 5
    t.datetime :created_at
    t.datetime :updated_at
  end
  add_index(:RAILS_ADMIN_HISTORIES, [:item, :table, :month, :year], :name => :index_rails_admin_histories)

  create_table :SCHEMA_MIGRATIONS, :id => false do |t|
    t.string :version, :limit => 255
  end

  create_table :SQLITE_SEQUENCE, :id => false do |t|
    t.integer :name
    t.integer :seq
  end

  create_table :STORIES do |t|
    t.references :PEOPLE
    t.string :title, :limit => 255
    t.text :content
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :UPDATE_ACTIONS do |t|
    t.references :PEOPLE
    t.string :comment, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :USERS do |t|
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

  create_table :AUTHENTICATIONS do |t|
    t.references :USERS
    t.string :provider, :limit => 255
    t.string :uid, :limit => 255
    t.string :token, :limit => 255
    t.string :token_secret, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :MY_CREDIT_CARDS do |t|
    t.references :USERS
    t.string :cc_number, :limit => 255
    t.string :cc_cvc, :limit => 255
    t.string :cc_exp_year, :limit => 255
    t.string :cc_exp_month, :limit => 255
    t.string :cc_name, :limit => 255
    t.string :cc_type, :limit => 255
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :PEOPLE_USERS, :id => false do |t|
    t.references :PEOPLE
    t.references :USERS
  end

end
