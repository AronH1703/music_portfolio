class Admin::DashboardController < Admin::BaseController
  def index
    @videos_count = Video.count
    @songs_count = defined?(Song) ? Song.count : 0
    @subscribers_count = NewsletterSubscriber.count
  end
end

