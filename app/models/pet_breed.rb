class PetBreed < ApplicationRecord
  belongs_to :breed
  belongs_to :pet
end
