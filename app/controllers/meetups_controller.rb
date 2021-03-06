class MeetupsController < ApplicationController
  def index
    @meetup_events = meetup_events
  end

  private
  def meetup_events
    Rails.cache.fetch('meetup_events', expires_in: 1.hour) do
      MeetupEvent.all
    end
  end
end
