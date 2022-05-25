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
class Watchlist < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })
end
