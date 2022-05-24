class Pet < ApplicationRecord

  belongs_to :user, foreign_key: "adopter_id", optional: true
  
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
  validates(:human_socialability_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:home_alone_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:enrichment_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:dog_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:children_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:cat_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })
  validates(:activity_competability_ranking, { :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 } })

end
