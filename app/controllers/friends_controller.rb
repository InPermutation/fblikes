require 'koala'

class FriendsController < ApplicationController
  before_filter :must_have_token
  before_filter :api
  
  def index
  end

  def get
  end

  private
    def must_have_token
      redirect_to root_url unless session[:token]
    end

    def api
      @api = Koala::Facebook::API.new(session[:token])
    rescue
      redirect_to root_url
    end
end
