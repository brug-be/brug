class Member < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :gatherings, through: :participations
  has_many :created_gatherings, class_name: 'Gathering', foreign_key: 'owner_id'

  after_destroy :change_ownership_created_gatherings

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
    ActionController::Base.expire_fragment('members')
  end

  def self.create_from_username(username)
    user_data = TwitterClient.call.user(username).to_hash

    create! do |member|
      member.provider = 'twitter'
      member.uid = user_data[:id]
      member.name = user_data[:screen_name]
      member.avatar_url = user_data[:profile_image_url].gsub(/_normal/, "")
    end
  end

  def owns? gathering
    created_gatherings.include? gathering
  end

  def update_twitter_info
    begin
      if avatar = TwitterClient.call.user(name).try(:profile_image_url).try(:to_s).try(:gsub, /_normal/, '')
        update_column :avatar_url, avatar
      end
    rescue Twitter::Error::NotFound
      self.destroy
    end
  end

  private
  def change_ownership_created_gatherings
    created_gatherings.update_all owner_id: Member.first.id
  end
end
