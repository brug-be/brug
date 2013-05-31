require "minitest_helper"

describe Gathering do
  it "has participants" do
    gathering = Gathering.create!(name: 'Burgers!', location: 'Brussels', description: 'Omnomnomnom', start_at: Time.current, kind: 'food')
    3.times do |i|
      member = Member.create! uid: 123, name: "member #{i}", provider: 'twitter'
      gathering.members << member
    end

    gathering.members.count.must_equal 3
  end
end
