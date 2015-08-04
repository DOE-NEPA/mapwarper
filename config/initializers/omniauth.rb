SETUP_LINKEDIN_STATE = lambda do |env| 
	request = Rack::Request.new(env)
	env['omniauth.strategy'].options.authorize_params[:state] = ENV['LINKEDIN_STATE']
end

ActionController::Dispatcher.middleware.use OmniAuth::Builder do
	provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
	provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'], :setup => SETUP_LINKEDIN_STATE
end
