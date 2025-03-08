class NewsletterSubscribersController < ApplicationController
  def new
    @newsletter_subscriber = NewsletterSubscriber.new
  end

  def create
    @newsletter_subscriber = NewsletterSubscriber.new(newsletter_subscriber_params)
    if @newsletter_subscriber.save
      flash[:notice] = "You have successfully subscribed to the newsletter!"
      redirect_to newsletter_path
    else
      flash[:alert] = @newsletter_subscriber.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def newsletter_subscriber_params
    params.require(:newsletter_subscriber).permit(:email)
  end
end
