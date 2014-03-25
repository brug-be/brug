env 'MAILTO', 'cron@brug.be'

every :day, at: '00:05' do
  rake 'members:update_twitter_avatars', output: nil
end
