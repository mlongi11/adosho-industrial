class Breed < ApplicationRecord
  has_many(:preferences, { :class_name => "BreedPreference", :foreign_key => "breed_id", :dependent => :destroy })
  has_many(:breed_webs, { :class_name => "BreedWeb", :foreign_key => "primary_breed_id", :dependent => :destroy })
  has_many(:breed_web_associations, { :class_name => "BreedWeb", :foreign_key => "similar_breed_id", :dependent => :destroy })
  has_many(:pet_breeds, { :class_name => "PetBreed", :foreign_key => "breed_id", :dependent => :destroy })

  validates(:species, { :inclusion => { :in => [ "Dog", "Cat" ] } })

  enum species: [ :Dog, :Cat ]
end
