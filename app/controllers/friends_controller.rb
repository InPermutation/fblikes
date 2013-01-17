require 'koala'

class FriendsController < ApplicationController
  def index
    redirect_to root_path unless session[:token]

    @api = Koala::Facebook::API.new(session[:token])
  end
end
