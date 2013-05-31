class Gathering < ActiveRecord::Base
  has_many :participations
  has_many :members, through: :participations
end
