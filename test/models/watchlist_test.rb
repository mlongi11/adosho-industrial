# == Schema Information
#
# Table name: watchlists
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pet_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_watchlists_on_pet_id   (pet_id)
#  index_watchlists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_id => pets.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class WatchlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
