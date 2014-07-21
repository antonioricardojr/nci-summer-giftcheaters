class HomeController < ApplicationController
  
  def index   
        if params[:code]
            # acknowledge code and get access token from FB
            session[:access_token] = session[:oauth].get_access_token(params[:code])
        end 
 
        # auth established, now do a graph call:
        @api = Koala::Facebook::API.new(session[:access_token])
 
 
         
        end
    end
     
    #########################################################
     
    def login
        session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/')
        @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream publish_stream")  
 
        redirect_to @auth_url
    end
     
    #########################################################

  def user
  end

end
