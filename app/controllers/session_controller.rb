require 'koala'

class SessionController < ApplicationController
  def index
  end

  def create
    session[:token] = params[:token]
    # TODO: redirect to /friends
  end
end
