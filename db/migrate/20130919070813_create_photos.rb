class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :location
      t.belongs_to :person
      t.timestamps
    end
  end
end
