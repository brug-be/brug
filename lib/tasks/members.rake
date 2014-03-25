namespace :members do
  desc "Update twitter avatar"
  task :update_twitter_avatars => :environment do
    Member.all.map &:update_twitter_info
  end
end
