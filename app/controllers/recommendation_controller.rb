require 'koala'
class RecommendationController < ApplicationController

	

	def friendsprofile
		@api = Koala::Facebook::API.new(session[:access_token])	
		@friend_profile = @api.get_object(params[:id_friend])
		
		@friend_likes = @api.get_connections(@friend_profile["id"], "likes")
		@friend_likes_filtered, @categories, @links_categories = filter_likes(@friend_likes)
	end


	def filter_likes(friend_likes)

		filtered_likes = []
		categories = {}
		links_categories = {}
		
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
			categories[like_filtered['category']] = category.length
			link = '/search?param1=' + like_filtered['category'] + '&param2=' + like_filtered['name'].to_param
			links_categories[like_filtered['category']] = link
		end
		return filtered_likes, categories, links_categories
	end

end