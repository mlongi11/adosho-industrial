class BreedPreferences < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:breed, { :required => true, :class_name => "ListOfBreed", :foreign_key => "breed_id" })

end
