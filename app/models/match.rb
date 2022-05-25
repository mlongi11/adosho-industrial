# == Schema Information
#
# Table name: matches
#
#  id             :bigint           not null, primary key
#  match_strength :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pet_id         :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_matches_on_pet_id   (pet_id)
#  index_matches_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_id => pets.id)
#  fk_rails_...  (user_id => users.id)
#
class Match < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :pet, required: true

  # belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })
  # belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
end
