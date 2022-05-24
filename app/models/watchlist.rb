class Watchlist < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id" })

end
