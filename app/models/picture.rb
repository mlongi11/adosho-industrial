class Picture < ApplicationRecord

  belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id", :counter_cache => true })

end
