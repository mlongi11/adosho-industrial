class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.integer :pet_id
      t.string :image

      t.timestamps
    end
  end
end
