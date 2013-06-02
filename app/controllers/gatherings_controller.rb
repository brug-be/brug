class GatheringsController < ApplicationController
  before_filter :member_required, except: [:index]
  def index
    @gatherings = Gathering.future
    render :layout => 'landing'
  end

  def new
    @gathering = current_member.created_gatherings.new
  end

  def create
    @gathering = current_member.created_gatherings.new gathering_params
    if @gathering.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @gathering = current_member.created_gatherings.find params[:id]
  end

  def update
    @gathering = current_member.created_gatherings.find params[:id]
    @gathering.attributes = gathering_params
    if @gathering.save
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @gathering = current_member.created_gatherings.find params[:id]
    @gathering.destroy
    redirect_to :root
  end

  private
  def gathering_params
    params.require(:gathering).permit(:name, :location, :kind, :description, :start_at)
  end
end
