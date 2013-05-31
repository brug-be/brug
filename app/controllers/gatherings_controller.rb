class GatheringsController < ApplicationController
  before_filter :member_required, except: [:index]
  def index
    @gatherings = Gathering.future
  end

  def new
    @gathering = current_member.created_gatherings.new
  end

  def create
    @gathering = current_member.created_gatherings.new params[:gathering]
    if @gathering.save
      redirect_to @gathering
    else
      render :new
    end
  end

  def edit
    @gathering = current_member.created_gatherings.find params[:id]
  end

  def update
    @gathering = current_member.created_gatherings.find params[:id]
    @gathering = current_member.created_gatherings.attributes = params[:gathering]
    if @gathering.save
      redirect_to @gathering
    else
      render :edit
    end
  end

  def destroy
    @gathering = current_member.created_gatherings.find params[:id]
    @gathering.destroy
    redirect_to :root
  end
end
