class HomeController < ApplicationController
  
  def index
  end

  def user
  	@rest = Koala::Facebook::GraphAndRestAPI.new(params[:home])
  end

end
