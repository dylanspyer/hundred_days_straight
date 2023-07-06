require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"

configure do
  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => "a4ea054825322dacaf1aa2a9b289712d5032db04c2398bf7b12527e14d4fd819da4cf88c198dc4ee00a34ed7020663bc3e8a6263fd5862259acabbc3c45b4c5b"
end

get "/" do
  @grid_cells = (1..100).to_a

  erb :index, layout: :layout
end

get "/clicked/:number" do
  @grid_cells = (1..100).to_a
  number = params[:number].to_i

  session[:clicked] ||= []

  if session[:clicked].include?(number)
    session[:clicked].delete(number)
  else
    session[:clicked] << number
  end

  redirect "/"
  erb :index, layout: :layout
end

post '/:goal' do
  goal_name = params[:goal_name]
  

end


## Features
# A reset button
# A way to input the thing you're working on
# A history of things you've started and how far you got
# Meta information about when you marked the box complete (?)

# User visits home page
# User is prompted to type a goal
# On submission of goal, user is brought to a page which has
  # The goal name at the top of the page
  # A 10 x 10 grid that can be clicked to turn green