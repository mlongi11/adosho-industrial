class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.references :pet, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
