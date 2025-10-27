class MusicController < ApplicationController
  def index
    @songs = Song.order(created_at: :desc)
  end
end
