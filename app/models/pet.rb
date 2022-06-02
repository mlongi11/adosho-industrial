# == Schema Information
#
# Table name: pets
#
#  id                                        :bigint           not null, primary key
#  activity_competability_ranking            :integer
#  adoption_center_identifier                :string
#  cat_competability_ranking                 :integer
#  children_competability_ranking            :integer
#  dog_competability_ranking                 :integer
#  enrichment_competability_ranking          :integer
#  estimated_birthday                        :date
#  gender                                    :string
#  home_alone_competability_ranking          :integer
#  human_socialability_competability_ranking :integer
#  name                                      :string
#  notes                                     :text
#  picture                                   :string
#  pictures_count                            :integer
#  species                                   :string
#  status                                    :string
#  weight                                    :float
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#
class Pet < ApplicationRecord
  
  has_many :watchlists, foreign_key: "pet_id", dependent: :destroy
  has_many :pet_breeds, foreign_key: "pet_id", dependent: :destroy
  has_many :matches, foreign_key: "pet_id", dependent: :destroy
  has_many :pictures, foreign_key: "pet_id", dependent: :destroy

  # belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "adopter_id" })
  # has_many(:watchlists, { :class_name => "Watchlist", :foreign_key => "pet_id", :dependent => :destroy })
  # has_many(:pet_breeds, { :class_name => "PetBreed", :foreign_key => "pet_id", :dependent => :destroy })
  # has_many(:matches, { :class_name => "Match", :foreign_key => "pet_id", :dependent => :destroy })
  # has_many(:pictures, { :class_name => "Picture", :foreign_key => "pet_id", :dependent => :destroy })

  has_many :prospective_parents, through: :watchlists, source: :user
  has_many :matched_parents, through: :matches, source: :user
  # has_many(:prospective_parents, { :through => :watchlists, :source => :user })
  # has_many(:matched_parents, { :through => :matches, :source => :user })

  validates(:species, { :inclusion => { :in => [ "Dog", "Cat" ] } })
  validates(:human_socialability_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })
  validates(:home_alone_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })
  validates(:enrichment_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })
  validates(:dog_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })
  validates(:children_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })
  validates(:cat_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })
  validates(:activity_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }, :allow_nil => true })

  scope :by_creation, -> { order(created_at: :desc) }

end
