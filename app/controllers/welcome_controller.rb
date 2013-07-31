class WelcomeController < ApplicationController
  def index
  	@consumer_tokens=TestServiceToken.all :conditions=>{:user_id=>current_user.id}
    @token = @consumer_tokens.first.client
  	logger.info "private data: " + @token.get("/api/v2/users").body
  end
end
