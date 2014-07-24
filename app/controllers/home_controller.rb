require 'koala'
class HomeController < ApplicationController

	def index  
        if params[:code]
            # acknowledge code and get access token from FB
            session[:access_token] = session[:oauth].get_access_token(params[:code])
        end 

        # auth established, now do a graph call:
        @api = Koala::Facebook::API.new(session[:access_token])

        begin
            @user_profile = @api.get_object("me")
            #render :file => '/home/welcome'
            redirect_to '/welcome'
        rescue Exception=>ex
            puts ex.message
            #if user is not logged in and an exception is caught, redirect to the page where logging in is requested
            #redirect_to '/login' and return
        end

        respond_to do |format|
            format.html {   }   
        end
    end

    #########################################################

    def login
    	session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL)
    	@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"email user_friends")


    	redirect_to @auth_url 
    end

    #########################################################

    def logout
        session[:access_token] = nil
        redirect_to '/'
    end

    def welcome
        @api = Koala::Facebook::API.new(session[:access_token])
        @user_profile = @api.get_object("me")
        @friends = @api.get_connections(@user_profile["id"], "friends?fields=id,name,link")
    end

    def about
    end

end