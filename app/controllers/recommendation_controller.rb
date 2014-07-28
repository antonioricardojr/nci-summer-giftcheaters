require 'koala'
class RecommendationController < ApplicationController

	

	def friendsprofile
		@api = Koala::Facebook::API.new(session[:access_token])	
		@friend_profile = @api.get_object(params[:id_friend])
		
		@friend_likes = @api.get_connections(@friend_profile["id"], "likes")
		@friend_likes_filtered = filter_likes(@friend_likes)
	end


	def filter_likes(friend_likes)

		filtered_likes = []

		
		friend_likes.each do |like_1|
			category = []
			category.push(like_1)
			friend_likes.delete(like_1)

			friend_likes.each do |like_2|
				if like_1['category'] == like_2['category']
						category.push(like_2)
					
					friend_likes.delete(like_2)

				end			
			end



			like_filtered = category[rand(category.length)]
			filtered_likes.push(like_filtered) 
		end
		return filtered_likes
	end

end