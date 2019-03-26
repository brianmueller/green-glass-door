require 'dotenv/load'
require 'bundler'
Bundler.require
# require 'unirest'

# require 'net/http'
# require 'json'

require_relative 'models/enter.rb'
require_relative 'models/associate.rb'
require_relative 'models/texter.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/stage1' do
    
    @user_input = params[:user_input]
    
    # log inputs to gSheet (currently off)
    # uri = URI('https://maker.ifttt.com/trigger/ggd/with/key/i7dk92evnRWIqDNLiaX5XW301St8kDkaAYA_qz-9kAC')
    # res = Net::HTTP.post_form(uri, 'value1' => @user_input)
    # puts res.body

    @user_can = ggd_can(@user_input)
    @user_color = ggd_color(@user_input)

    @user_can_opp = ggd_test(@user_input) ? "CAN'T" : "CAN"
    @user_color_opp = ggd_test(@user_input) ? "red" : "green"

    opposite_w_remaining = get_opposite(@user_input)
    @opp_example = opposite_w_remaining["opposite_word"]
    @remaining = opposite_w_remaining["remaining"]
    puts "#{@remaining} remaining"
    if (@remaining.to_i <= 1000 && @remaining.to_i%100==0)
      send_message(@remaining)
    end
    erb :stage1
  end

end
