%w[hannesfostie joren jeroen_j rkh tenderlove dhh ev zhann holman qrush coreyhaines kytrinyx junkiesxl phoet rodreegez atog philnash ryanstenhouse mediafinger floordrees teabass mislav avdi].each { |username| Member.create_from_username username }

lipsum = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
gathering_types = %w[usergroup drinkup food conference]
member_ids = Member.all.pluck(:id)

Gathering.create(name: 'Nordic Ruby', location: 'Sweden', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)
Gathering.create(name: 'ArrrrCamp', location: 'Ghent', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)
Gathering.create(name: 'Ghent User Group', location: 'Ghent', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)
Gathering.create(name: 'OpenHack Brussels', location: 'Brussels', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)
Gathering.create(name: 'Ruby Boulets', location: 'Liege', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)
Gathering.create(name: 'Beer!', location: 'Ghent', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)
Gathering.create(name: 'BaRuCo', location: 'Barcelona, Spain', description: lipsum, kind: gathering_types.sample, start_at: (0..35).to_a.sample.days.from_now, owner_id: member_ids.sample)

Gathering.all.each do |gathering|
  gathering.members << Member.where(id: member_ids.sample((0..member_ids.count).to_a.sample))
end
