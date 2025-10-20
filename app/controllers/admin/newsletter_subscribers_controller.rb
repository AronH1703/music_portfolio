require 'csv'

class Admin::NewsletterSubscribersController < Admin::BaseController
  def index
    @subscribers = NewsletterSubscriber.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.csv do
        send_data csv_string, filename: "subscribers-#{Time.now.to_i}.csv"
      end
    end
  end

  def emails
    @emails = NewsletterSubscriber.order(created_at: :asc).pluck(:email).join(', ')
  end

  def export
    send_data csv_string, filename: "subscribers-#{Time.now.to_i}.csv"
  end

  def destroy
    NewsletterSubscriber.find(params[:id]).destroy
    redirect_to admin_newsletter_subscribers_path, notice: 'Subscriber removed.'
  end

  private

  def csv_string
    CSV.generate(headers: true) do |csv|
      csv << %w[email created_at]
      NewsletterSubscriber.find_each do |s|
        csv << [s.email, s.created_at]
      end
    end
  end
end

