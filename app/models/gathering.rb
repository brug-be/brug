class Gathering < ActiveRecord::Base
  has_many :participations
  has_many :members, through: :participations

  scope :futur, where("start_at > '#{Time.now.beginning_of_day}'")
end
