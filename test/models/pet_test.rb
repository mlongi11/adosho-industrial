# == Schema Information
#
# Table name: pets
#
#  id                                        :bigint           not null, primary key
#  activity_competability_ranking            :integer
#  adoption_center_identifier                :string
#  cat_competability_ranking                 :integer
#  children_competability_ranking            :integer
#  dog_competability_ranking                 :integer
#  enrichment_competability_ranking          :integer
#  estimated_birthday                        :date
#  gender                                    :string
#  home_alone_competability_ranking          :integer
#  human_socialability_competability_ranking :integer
#  name                                      :string
#  notes                                     :text
#  picture                                   :string
#  pictures_count                            :integer
#  species                                   :string
#  status                                    :string
#  weight                                    :float
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#
require "test_helper"

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
