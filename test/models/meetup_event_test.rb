require 'minitest_helper'
require 'json'
require 'ostruct'

describe MeetupEvent do
  let(:json_payload) do
    OpenStruct.new(body:
      File.read(Rails.root.join('test', 'fixtures', 'meetup_events.json'))
    )
  end

  it 'retrieves all BRUG events from Meetup' do
    HTTParty.stub(:get, json_payload) do
      MeetupEvent.all.count.must_equal 1
    end
  end

  describe 'when parsing Meetup JSON payload' do
    let(:event) do
      HTTParty.stub(:get, json_payload) do
        MeetupEvent.all.first
      end
    end

    it 'gets the name' do
      event.name.must_equal 'BRUG December 2014: Hack evening'
    end

    it 'gets the description' do
      event.description.must_equal "<p>Cold, dark, early dusk -<br/>Enter, get shelter with us<br/>Rubies are shining.</p> <p>\n\n\nLet's code together. It's simple: bring your current code problem, code on an open source project, or just come to help.</p> <p>Catering: pizzas and drinks, 10 Euros</p> <p><br/>Don't hesitate to share in the comments what you'd like to work on, I list them below.</p> <p><br/>List of projects:</p> <p>• ...</p>"
    end

    it 'gets the number of attendees' do
      event.attendees.must_equal 12
    end

    it 'gets the address' do
      event.address.must_equal '4 Rue des Pères Blancs, 1040 Etterbeek'
    end

    it 'gets the venue' do
      event.venue.must_equal 'Cafetaria at BetaCowork / ICAB'
    end

    it 'gets the url' do
      event.url.must_equal 'http://www.meetup.com/brug__/events/218744835/'
    end

    it 'gets the time' do
      event.time.must_equal Time.at(1_417_543_200_000 / 1000).to_datetime
    end
  end
end