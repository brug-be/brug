class PagesController < ApplicationController
  def landing
    @gatherings = Gathering.future
    @next_gathering = @gatherings.try(:first)
    render :layout => 'landing'
  end

  def blog
  end
end
