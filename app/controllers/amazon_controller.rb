require 'amazon/ecs'

class AmazonController < ApplicationController



	Amazon::Ecs.configure do |options|
		options[:associate_tag] = 'blablabla'
		options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
		options[:AWS_secret_key] = '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'



def item_search
	#@res = Amazon::Ecs.item_search("Harry Potter", :country => 'uk')
	@res = Amazon::Ecs.item_search("Harry Potter", {:response_group => "Medium", :country => 'uk'})

end

end


end