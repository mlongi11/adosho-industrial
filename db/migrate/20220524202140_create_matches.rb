class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :match_strength

      t.timestamps
    end
  end
end
