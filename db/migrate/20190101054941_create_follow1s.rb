class CreateFollow1s < ActiveRecord::Migration[5.1]
  def change
    create_table :follow1s do |t|
      t.integer :user_id
      t.integer :follow_user_id

      t.timestamps
    end
  end
end
