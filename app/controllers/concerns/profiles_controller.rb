class ProfilesController < ApplicationController
  before_filter :member_required

  def show
    @member = current_member
  end

  def destroy
    @member = current_member
    @member.destroy
    redirect_to :root, notice: 'Sorry to see you go.'
  end
end
