class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def test
  end

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
