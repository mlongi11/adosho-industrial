# == Schema Information
#
# Table name: breeds
#
#  id         :bigint           not null, primary key
#  breed_name :string
#  species    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BreedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
