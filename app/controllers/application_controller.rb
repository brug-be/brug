class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def meetup_events
    json = HTTParty.get("https://api.meetup.com/2/events?&sign=true&photo-host=public&group_id=15138792,12922902,5356052&page=20&key=#{ENV['MEETUP_API_KEY']}").body
    @meetup_events ||= JSON.parse(json)['results']
  end
  helper_method :meetup_events

  private
  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def member_required
    session[:awesome_redirect] = request.fullpath
    redirect_to '/auth/twitter' unless current_member.present?
  end
end
