require 'koala'
require 'amazon/ecs'

class ApplicationController < ActionController::Base
  protect_from_forgery



Amazon::Ecs.configure do |options|
  options[:associate_tag] = 'giftch-21'
  options[:AWS_access_key_id] = 'AKIAJRKRRNB5DXRVZYWQ'
  options[:AWS_secret_key] = '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'
end




end
