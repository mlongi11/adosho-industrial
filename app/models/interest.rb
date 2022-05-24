class Interest < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  validates(:home_alone_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:dog_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:children_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:cat_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:activity_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:human_sociability_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:enrichment_competability_preference, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })

end
