class AddLikesTable < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :song
    end
  end
end
