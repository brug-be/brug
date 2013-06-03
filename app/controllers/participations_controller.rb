class ParticipationsController < ApplicationController
  before_filter :member_required

  def join
    @gathering = Gathering.find params[:gathering_id]
    @gathering.members << current_member
    redirect_to :root
  end

  def leave
    @gathering = Gathering.find params[:gathering_id]
    @gathering.participations.where(member: current_member).delete_all
    redirect_to :root
  end
end
