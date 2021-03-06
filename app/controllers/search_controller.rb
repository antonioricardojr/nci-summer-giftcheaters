require 'amazon/ecs'
require 'amazon/aws'
require 'amazon/aws/search'

 include Amazon::AWS
 include Amazon::AWS::Search

class SearchController < ApplicationController

NUM_RESULTS = 6

	Amazon::Ecs.configure do |options|
		options[:associate_tag] = 'blablabla'
		options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
		options[:AWS_secret_key] = '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'

	ASSOCIATES_ID = "blabla"
  	KEY_ID = 'AKIAJRKRRNB5DXRVZYWQ'
  	req = Request.new(KEY_ID, ASSOCIATES_ID, 'us', false)


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
			:country => 'us'
			})

	@most_relevant_res = firsts_results(@res)

	@first_res = first_result(@most_relevant_res)	
	
	asin = @first_res.get('ASIN')

	@sl = Amazon::AWS::SimilarityLookup.new(asin.chars) #the .chars is required because of the incompatibility 
													   # in the ruby versions.

end

def first_result(res)
	return res[0]
end



def firsts_results(results)
	res = []
	 if(results.total_results > NUM_RESULTS)
		num_results = 6
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