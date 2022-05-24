class BreedWeb < ApplicationRecord
  belongs_to :primary_breed
  belongs_to :similar_breed
end
