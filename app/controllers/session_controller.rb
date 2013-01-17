require 'koala'

class SessionController < ApplicationController
  def index
  end

  def create
    session[:token] = params[:token]
    redirect_to friends_path
  end
end
