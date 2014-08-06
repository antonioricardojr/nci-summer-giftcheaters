module ApplicationHelper

	def site_name
	    # Change the value below between the quotes.
	    "GiftCheaters"
	end

	def site_url
		SITE_URL
	end

	def meta_author
	    # Change the value below between the quotes.
	    "Antonio Marquer, Gemma Bradly and Maria Matos"
	end

	def meta_description
	    # Change the value below between the quotes.
	    "Add your website description here"
	end

	def meta_keywords
	    # Change the value below between the quotes.
	    "Add your keywords here"
	end

	# Returns the full title on a per-page basis.
  	# No need to change any of this we set page_title and site_name elsewhere.
  	def full_title(page_title)
  		if page_title.empty?
  			site_name
  		else
  			"#{page_title} | #{site_name}"
  		end
  	end
  end
