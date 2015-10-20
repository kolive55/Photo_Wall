class AddRefs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.references :user_id
    end
  end
end
