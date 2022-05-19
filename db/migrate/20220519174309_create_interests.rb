class CreateInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :interests do |t|
      t.boolean :interested_in_fostering_dogs
      t.boolean :interested_in_fostering_cats
      t.boolean :interested_in_adopting_dogs
      t.boolean :interested_in_adopting_cats
      t.integer :children_competability_preference
      t.integer :dog_competability_preference
      t.integer :cat_competability_preference
      t.integer :activity_competability_preference
      t.integer :home_alone_competability_preference
      t.integer :human_sociability_competability_preference
      t.integer :enrichment_competability_preference

      t.timestamps
    end
  end
end
