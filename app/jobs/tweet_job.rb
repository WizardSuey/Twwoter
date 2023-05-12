class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
  end
end
