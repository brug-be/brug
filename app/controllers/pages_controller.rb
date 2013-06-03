class PagesController < ApplicationController
  def landing
    @gatherings = Gathering.future
    render :layout => 'landing'
  end

  def blog
  end
end
