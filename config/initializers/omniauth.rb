Rails.application.config.middleware.use OmniAuth::Builder do
	provider :gplus, ENV["GPLUS_ID"], ENV["GPLUS_SECRET"]
end