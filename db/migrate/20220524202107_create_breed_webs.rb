class CreateBreedWebs < ActiveRecord::Migration[6.1]
  def change
    create_table :breed_webs do |t|
      t.references :primary_breed, null: false, foreign_key: {to_table: :breeds}
      t.references :similar_breed, null: false, foreign_key: {to_table: :breeds}

      t.timestamps
    end
  end
end
