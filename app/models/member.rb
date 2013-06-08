class Member < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :gatherings, through: :participations
  has_many :created_gatherings, class_name: 'Gathering', foreign_key: 'owner_id', dependent: :nullify

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |member|
      member.provider = auth["provider"]
      member.uid = auth["uid"]
      member.name = auth["info"]["nickname"]
      member.avatar_url = auth["info"]["image"].gsub(/_normal/, "")
    end
  end

  def self.create_from_username(username)
    response = HTTParty.get("https://api.twitter.com/1/users/show.json?screen_name=#{username}").to_hash
    create! do |member|
      member.provider = 'twitter'
      member.uid = response['id']
      member.name = response['screen_name']
      member.avatar_url = response['profile_image_url'].gsub(/_normal/, "")
    end
  end

  def owns? gathering
    created_gatherings.include? gathering
  end
end
