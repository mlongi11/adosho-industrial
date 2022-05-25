class CreateBreedPreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :breed_preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
