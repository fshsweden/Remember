class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :person
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :stories, :person_id
  end
end
