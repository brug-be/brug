class MeetupEvent
  attr_reader :name, :description, :time, :attendees, :venue, :address, :url

  def initialize(attrs)
    @name = attrs[:name]
    @description = attrs[:description]
    @time = Time.at(attrs[:time] / 1000).to_datetime
    @attendees = attrs[:attendees]
    @address = attrs[:address]
    @venue = attrs[:venue]
    @url = attrs[:url]
  end

  class << self
    def all
      json = HTTParty.get("https://api.meetup.com/2/events?&sign=true&photo-host=public&group_id=15138792,12922902,5356052&page=20&key=#{ENV['MEETUP_API_KEY']}").body
      raw_events = JSON.parse(json)['results']
      raw_events = [] unless raw_events
      events = []
      raw_events.each do |event|
        venue = create_venue_from_payload(event['venue'])
        events << MeetupEvent.new(
          name: event['name'],
          description: event['description'],
          time: event['time'],
          attendees: event['yes_rsvp_count'],
          address: venue.address,
          venue: venue.name,
          url: event['event_url']
        )
      end
      events
    end

    private
    # NullObject for Venue
    class NullVenue
      attr_reader :address, :name
      def initialize
        @address = ""
        @name = "None"
      end
    end

    # A Venue is a place with a name
    class Venue
      attr_reader :address, :name
      def initialize(name: "", address: "")
        @name = name
        @address = address

        @address = "" unless @address
        @name = "None" unless @name
      end
    end

    # Factory method
    def create_venue_from_payload(venue_hash)
      return NullVenue.new if venue_hash.nil?

      Venue.new(
        name: venue_hash["name"],
        address: venue_hash["address_1"]
      )
    end
  end
end
