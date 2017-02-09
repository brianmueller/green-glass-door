require 'bundler'
Bundler.require
# require 'unirest'
require_relative 'models/enter.rb'
require_relative 'models/associate.rb'
require_relative 'models/texter.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/stage1' do
    @user_input = params[:user_input]

    @user_can = ggd_can(@user_input)
    @user_color = ggd_color(@user_input)

    @user_can_opp = ggd_test(@user_input) ? "CAN'T" : "CAN"
    @user_color_opp = ggd_test(@user_input) ? "red" : "green"

    opposite_w_remaining = get_opposite(@user_input)
    @opp_example = opposite_w_remaining["opposite_word"]
    @remaining = opposite_w_remaining["remaining"]
    if (@remaining.to_i <= 1000 && @remaining.to_i%100==0)
      send_message(@remaining)
    end
    erb :stage1
  end

end
