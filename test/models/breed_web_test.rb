# == Schema Information
#
# Table name: breed_webs
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  primary_breed_id :bigint           not null
#  similar_breed_id :bigint           not null
#
# Indexes
#
#  index_breed_webs_on_primary_breed_id  (primary_breed_id)
#  index_breed_webs_on_similar_breed_id  (similar_breed_id)
#
# Foreign Keys
#
#  fk_rails_...  (primary_breed_id => breeds.id)
#  fk_rails_...  (similar_breed_id => breeds.id)
#
require "test_helper"

class BreedWebTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
