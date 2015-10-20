class RenameColumn < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.rename :user_id_id, :user_id
    end  
  end
end
