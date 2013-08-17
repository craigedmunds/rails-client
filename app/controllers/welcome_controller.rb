class WelcomeController < ApplicationController
  def index
  	
  	if current_user
	  	@consumer_tokens=TestServiceToken.all :conditions=>{:user_id=>current_user.id}
	    

	    @token = @consumer_tokens.first

	    if @token
	    	@client = @token.client


				#logger.info "Diag: " + @client.consumer.http.inspect

	    	@client.consumer.http.set_debug_output $stderr
	    	@response = @client.get("/api/v2/users")
	    	@data = @response.body

		  	logger.info "private data: " + @response.inspect
		  end
		end
  end
end
