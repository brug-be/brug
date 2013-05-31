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

  it "has a futur scope" do
    Gathering.destroy_all
    # today
    Gathering.create!(name: 'Burgers!', location: 'Brussels', description: 'Omnomnomnom', start_at: Time.current, kind: 'food')
    # futur
    3.times do |i|
      Gathering.create!(name: "Burgers! #{i}", location: 'Brussels', description: 'Omnomnomnom', start_at: 2.days.from_now, kind: 'food')
    end
    #history
    2.times do |i|
      Gathering.create!(name: "Burgers! #{i}", location: 'Brussels', description: 'Omnomnomnom', start_at: 2.days.ago, kind: 'food')
    end

    Gathering.futur.count.must_equal 4
  end
end
