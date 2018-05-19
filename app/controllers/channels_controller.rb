class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
  end

  def new
  end
end
