require 'koala'

class FriendsController < ApplicationController
  before_filter :must_have_token
  before_filter :api
  
  def index
    @friends = @api.get_connections("me", "friends")
  end

  def get
    @them = @api.get_object(params[:id])
   
    mine, theirs = @api.batch do |batch_api|
        batch_api.get_connections("me", "likes")
        batch_api.get_connections(@them['id'], 'likes')
    end

    mine.map! { |like| like['id'] }
    theirs.map! { |like| like['id'] }

    @shared = mine.select { |id| theirs.include? id }
    @shared.map! { |id| @api.get_object(id) }


  end

  private
    def must_have_token
      redirect_to root_url unless session[:token]
    end

    def api
      @api = Koala::Facebook::API.new(session[:token])
      @me = @api.get_object("me")
    rescue
      redirect_to root_url
    end
end
