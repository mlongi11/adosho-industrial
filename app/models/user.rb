# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account_type           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  match_count            :integer
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  watchlist_count        :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :preferences, class_name: "BreedPreference", foreign_key: "user_id", dependent: :destroy
  has_one :interest, foreign_key: "user_id", dependent: :destroy
  has_one :watchlist, class_name: "Watchlist", foreign_key: "user_id", dependent: :destroy
  has_one :match_list, class_name: "Match", foreign_key: "user_id", dependent: :destroy
        
  # has_many(:preferences, { :class_name => "BreedPreference", :foreign_key => "user_id", :dependent => :destroy })
  # has_one(:interest, { :class_name => "Interest", :foreign_key => "user_id", :dependent => :destroy })
  # has_many(:watchlists, { :class_name => "Watchlist", :foreign_key => "user_id", :dependent => :destroy })
  # has_many(:matches, { :class_name => "Match", :foreign_key => "user_id", :dependent => :destroy })

  has_many :watched_pets, through: :watchlists, source: :pet
  has_many :matched_pets, through: :matches, source: :pet

  # has_many(:watched_pets, { :through => :watchlists, :source => :pet })
  # has_many(:matched_pets, { :through => :matches, :source => :pet })

  validates(:phone_number, { :format => { :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/ } })
  validates(:phone_number, { :presence => true })
  validates(:account_type, { :inclusion => { :in => [ "User", "Administrator" ] } })

  enum account_type: [ :User, :Administrator ]

end
