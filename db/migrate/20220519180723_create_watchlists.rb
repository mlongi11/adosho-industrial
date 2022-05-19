class CreateWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
