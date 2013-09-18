class AddJoinModelForUserAndPeople < ActiveRecord::Migration
  def change
    create_table :people_users, :id => false do |t|
      t.belongs_to :person
      t.belongs_to :user
    end
  end
end
