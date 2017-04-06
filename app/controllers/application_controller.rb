# require './environment'

require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :'super_hero'
    end

    post '/teams' do
      @team = Team.new(params[:team][:name], params[:team][:motto])

      params[:team][:heroes].each do |each_instance|
        SuperHero.new(each_instance[:name], each_instance[:power], each_instance[:bio])
      end

      @heroes = SuperHero.all
      erb :'team'
      # binding.pry
    end
end
