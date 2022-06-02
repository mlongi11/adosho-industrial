# == Schema Information
#
# Table name: pictures
#
#  id         :bigint           not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pet_id     :bigint           not null
#
# Indexes
#
#  index_pictures_on_pet_id  (pet_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_id => pets.id)
#
class Picture < ApplicationRecord
  belongs_to :pet, required: true, counter_cache: true

  mount_uploader :image, PicturesUploader
  # belongs_to(:pet, { :required => true, :class_name => "Pet", :foreign_key => "pet_id", :counter_cache => true })
end
