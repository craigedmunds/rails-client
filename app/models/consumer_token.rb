#app/models/consumer_token.rb
require 'oauth/models/consumers/token'

class ConsumerToken < ActiveRecord::Base
  include Oauth::Models::Consumers::Token

  # You can safely remove this callback if you don't allow login from any of your services
  before_create :make_user

  # Modify this with class_name etc to match your application
  belongs_to :user

  private

  def make_user
  	logger.info "ConsumerToken make_user"

    self.user ||= begin
      User.new {}
      user.save(:validate => false)
    end
  end
end