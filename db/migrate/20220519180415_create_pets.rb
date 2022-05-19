class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :estimated_birthday
      t.string :status
      t.integer :adopter_id
      t.string :gender
      t.decimal :weight
      t.integer :children_competability_ranking
      t.integer :dog_competability_ranking
      t.integer :cat_competability_ranking
      t.integer :home_alone_competability_ranking
      t.integer :activity_competability_ranking
      t.text :notes
      t.image_upload :picture
      t.integer :human_socialability_competability_ranking
      t.string :enrichment_competability_ranking
      t.string :adoption_center_identifier

      t.timestamps
    end
  end
end
