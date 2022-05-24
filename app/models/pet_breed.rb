class PetBreed < ApplicationRecord
  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })
  belongs_to(:breed, { :required => true, :class_name => "Breed", :foreign_key => "breed_id" })
end
