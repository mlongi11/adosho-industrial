class BreedWeb < ApplicationRecord
  belongs_to(:primary_breed, { :required => true, :class_name => "Breed", :foreign_key => "primary_breed_id" })
  belongs_to(:similar_breed, { :required => true, :class_name => "Breed", :foreign_key => "similar_breed_id" })
end
