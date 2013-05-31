class Gathering < ActiveRecord::Base
  has_many :participations
  has_many :members, through: :participations
  belongs_to :owner, class_name: 'Member'

  scope :future, where("start_at > '#{Time.now.beginning_of_day}'")
end
