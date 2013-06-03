class SessionsController < ApplicationController
  def create
    member = Member.from_omniauth(env["omniauth.auth"])
    session[:member_id] = member.id
    redirect_to session[:awesome_redirect] || :root
  end

  def destroy
    session[:member_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
