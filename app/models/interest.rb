# == Schema Information
#
# Table name: interests
#
#  id                                         :bigint           not null, primary key
#  activity_competability_preference          :integer
#  cat_competability_preference               :integer
#  children_competability_preference          :integer
#  dog_competability_preference               :integer
#  enrichment_competability_preference        :string
#  home_alone_competability_preference        :integer
#  human_sociability_competability_preference :integer
#  interested_in_adopting_cats                :boolean
#  interested_in_adopting_dogs                :boolean
#  interested_in_fostering_cats               :boolean
#  interested_in_fostering_dogs               :boolean
#  created_at                                 :datetime         not null
#  updated_at                                 :datetime         not null
#  user_id                                    :bigint           not null
#
# Indexes
#
#  index_interests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Interest < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  validates(:home_alone_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:dog_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:children_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:cat_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:activity_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })

end
