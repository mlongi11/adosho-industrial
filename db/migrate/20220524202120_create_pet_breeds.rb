class CreatePetBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_breeds do |t|
      t.references :breed, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
