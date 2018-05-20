class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find_by(id: params[:id])
  end

  def new
  end
end
