class Gathering < ActiveRecord::Base
  extend FriendlyId

  has_many :participations, dependent: :destroy
  has_many :members, through: :participations
  belongs_to :owner, class_name: 'Member'

  scope :future, -> { where("start_at > '#{Time.now.beginning_of_day}'").order('start_at ASC') }
  scope :past, -> { where("start_at < '#{Time.now.beginning_of_day}'").order('start_at ASC') }

  validates_presence_of :name, :location, :start_at, :description, :kind

  validates :url, format: {allow_blank: true, with: URI::regexp(%w(http https))}

  friendly_id :name, use: [:slugged, :finders]

  def members_count
    members.count
  end
end
