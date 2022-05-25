# == Schema Information
#
# Table name: pictures
#
#  id         :bigint           not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pet_id     :bigint           not null
#
# Indexes
#
#  index_pictures_on_pet_id  (pet_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_id => pets.id)
#
require "test_helper"

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
