class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many(:preferences, { :class_name => "BreedPreference", :foreign_key => "user_id", :dependent => :destroy })
  has_one(:interest, { :class_name => "Interest", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:pets, { :class_name => "Pet", :foreign_key => "adopter_id", :dependent => :destroy })
  has_many(:watchlists, { :class_name => "Watchlist", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:matches, { :class_name => "Match", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:watched_pets, { :through => :watchlists, :source => :pet })
  has_many(:matched_pets, { :through => :matches, :source => :pet })

  validates(:phone_number, { :format => { :with => "^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$" } })
  validates(:phone_number, { :presence => true })
  validates(:account_type, { :inclusion => { :in => [ "User", "Administrator" ] } })

  enum account_type: [ :User, :ADministrator ]

end
