require 'amazon/ecs'

class AmazonController < ApplicationController

	Amazon::Ecs.configure do |options|
		options[:associate_tag] = 'giftch-21'
		options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
		options[:AWS_secret_key] = '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'


	def item_search
		@res = Amazon::Ecs.item_search(params[:item], :country => 'uk', :search_index => 'Electronics')
		end

	end


end