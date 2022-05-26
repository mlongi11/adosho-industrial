# == Schema Information
#
# Table name: breed_preferences
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  breed_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_breed_preferences_on_breed_id  (breed_id)
#  index_breed_preferences_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (breed_id => breeds.id)
#  fk_rails_...  (user_id => users.id)
#
class BreedPreference < ApplicationRecord
  
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:breed, { :required => true, :class_name => "Breed", :foreign_key => "breed_id" })

end
