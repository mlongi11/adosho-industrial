class CreateListOfBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :list_of_breeds do |t|
      t.string :breed_name
      t.string :species

      t.timestamps
    end
  end
end
