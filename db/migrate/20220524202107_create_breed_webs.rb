class CreateBreedWebs < ActiveRecord::Migration[6.1]
  def change
    create_table :breed_webs do |t|
      t.references :primary_breed, null: false, foreign_key: true
      t.references :similar_breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
