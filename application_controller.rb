require 'bundler'
Bundler.require
# require 'unirest'
require_relative 'models/model.rb'
require_relative 'models/associate.rb'

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
    
    @user_can_opp = ggd_test(@user_input) ? "CAN'T" : "CAN"
    @user_color_opp = ggd_test(@user_input) ? "red" : "green"
        
    @opp_example = get_opposite(@user_input)
    erb :stage1
  end

end
