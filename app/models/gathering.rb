class Gathering < ActiveRecord::Base
  has_many :participations
  has_many :participants, through: :participations, source: :member
end
