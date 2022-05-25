# == Schema Information
#
# Table name: pet_breeds
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  breed_id   :bigint           not null
#  pet_id     :bigint           not null
#
# Indexes
#
#  index_pet_breeds_on_breed_id  (breed_id)
#  index_pet_breeds_on_pet_id    (pet_id)
#
# Foreign Keys
#
#  fk_rails_...  (breed_id => breeds.id)
#  fk_rails_...  (pet_id => pets.id)
#
class PetBreed < ApplicationRecord

  belongs_to :breed, required: true
  belongs_to :pet, required: true

  # belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })
  # belongs_to(:breed, { :required => true, :class_name => "Breed", :foreign_key => "breed_id" })
end
