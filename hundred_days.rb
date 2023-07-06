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
  @number = params[:number].to_i

  session[:clicked] ||= []
  session[:clicked] << @number
  

  redirect "/"
  erb :index, layout: :layout
end