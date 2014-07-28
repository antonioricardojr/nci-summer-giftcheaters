require 'amazon/ecs'

class SearchController < ApplicationController



	Amazon::Ecs.configure do |options|
		options[:associate_tag] = 'blablabla'
		options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
		options[:AWS_secret_key] = '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'


# This method removes the word "Unofficial" from the name of like pages. #
def remove_unofficial(name)
	name = params[:param2]
	l_name = name.partition(" ")
	l_name[0].clear
	name = ""
	l_name.each do |word|
		name += word
	end
	return name

end



def item_search
	
	@name = remove_unofficial(params[:param2])


	 #@res = Amazon::Ecs.item_search(@name, {:response_group => "Medium"})
	 @res = Amazon::Ecs.item_search(@name, {:response_group => 'Medium', :sort => 'salesrank', :search_index => @category})


	#@res = Amazon::Ecs.item_search(@name, :search_index => params[:param1])

end

end


end