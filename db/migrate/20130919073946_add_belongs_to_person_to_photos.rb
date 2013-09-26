class AddBelongsToPersonToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.belongs_to :person
    end
  end
end
