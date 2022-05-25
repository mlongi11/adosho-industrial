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
require "test_helper"

class PetBreedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
