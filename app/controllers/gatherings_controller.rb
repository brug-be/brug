class GatheringsController < ApplicationController
  def index
    @gatherings = Gathering.futur
  end
end
