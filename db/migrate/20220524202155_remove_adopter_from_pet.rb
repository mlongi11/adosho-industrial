class RemoveAdopterFromPet < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :adopter_id
  end
end