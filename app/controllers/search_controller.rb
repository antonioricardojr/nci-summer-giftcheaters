require 'amazon/ecs'

class SearchController < ApplicationController



	Amazon::Ecs.configure do |options|
		options[:associate_tag] = 'blablabla'
		options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
		options[:AWS_secret_key] = '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'



def item_search
	
	@res = Amazon::Ecs.item_search(params[:search], {:response_group => "Medium", :country => 'uk'})

end

end


end