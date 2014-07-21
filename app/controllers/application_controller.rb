require 'koala'
require 'amazon/ecs'

class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_user

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	Amazon::Ecs.configure do |options|
		options[:associate_tag] = 'giftch-21'
		options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
		options[:AWS_secret_key] = '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'
	end


	


end
