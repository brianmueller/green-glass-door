require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
#   get '/stage1' do
#     erb :stage1
#   end
  
  post '/stage1' do
    # ruby code
    @user_input = params[:user_input]
    @user_can = ggd_can(@user_input)
    @user_color = ggd_color(@user_input)
    erb :stage1
  end

end
