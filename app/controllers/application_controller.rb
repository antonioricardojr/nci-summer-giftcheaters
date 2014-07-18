require 'koala'

class ApplicationController < ActionController::Base
  protect_from_forgery

@oauth = Koala::Facebook::OAuth.new(309428675901394, "bb93a431aa2c57f02f93b6a3a0d7c38b", "/home/user")

 



end
