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


def define_category(f_category)
	a_category = "All"

	if f_category == "Movie"
		a_category = "Video"

	elsif f_category == "Musician/band"
		a_category = "Music"

	elsif f_category == "Author"
		a_category = "Books"

	elsif f_category == "Book"
		a_category = "Books"
	elsif f_category == "Actor/director"
		a_category = "Video"
	end
	return a_category
end


def item_search
	
	@name = remove_unofficial(params[:param2])
	@category = define_category(params[:param1])



	@res = Amazon::Ecs.item_search(@name, 
		{:response_group => 'Medium',  
			:search_index => @category,
			})

	@most_relevant_res = firsts_results(@res)
	

end


def firsts_results(results)
	res = []
	 if(results.total_results > 5)
		num_results = 5
	 else
	 	num_results = results.total_results
	end


	i = 0
	
	results.items.each do |item|

		if(i < num_results)
			res.push(item)
			i = i + 1	
		end
	end

	return res
end

end
end