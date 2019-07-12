class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :curent_user_id
      t.integer :follow_user_id

      t.timestamps
    end
  end
end
