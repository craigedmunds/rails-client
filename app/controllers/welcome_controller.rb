class WelcomeController < ApplicationController
  def index
  	@consumer_tokens=TestServiceToken.all :conditions=>{:user_id=>current_user.id}
    

    @token = @consumer_tokens.first

    if @token
    	@client = @token.client
    	@data = @client.get("/api/v2/users").body

	  	logger.info "private data: " + @data
	  end
  end
end
