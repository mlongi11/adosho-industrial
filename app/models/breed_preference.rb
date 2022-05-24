class BreedPreference < ApplicationRecord
  belongs_to :user
  belongs_to :breed
end
