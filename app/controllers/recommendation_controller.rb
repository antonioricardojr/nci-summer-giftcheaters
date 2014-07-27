require 'koala'
class RecommendationController < ApplicationController

	def friendsprofile
		@api = Koala::Facebook::API.new(session[:access_token])
		@friend_profile = @api.get_object(params[:id_friend])
		@friend_likes = @api.get_connections(@friend_profile["id"], "likes")
	end

end