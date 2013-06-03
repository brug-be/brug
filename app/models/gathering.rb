class Gathering < ActiveRecord::Base
  has_many :participations
  has_many :members, through: :participations
  belongs_to :owner, class_name: 'Member'

  scope :future, where("start_at > '#{Time.now.beginning_of_day}'").order('start_at ASC')

  validates_presence_of :name, :location, :start_at, :description, :kind

  def participation
    case members.count
    when 0
      "No one is attending yet"
    when 1
      "1 person attending"
    else
      "#{members.count} people attending"
    end
  end
end
