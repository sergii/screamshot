require_relative 'screenshot'
require 'sinatra/base'

class App < Sinatra::Base
  set :root, File.expand_path('../../', __FILE__)

  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
  end

  post '/screenshot' do
    url = params[:url]
    tmpfile = Screenshot.fetch(url)
    send_file tmpfile.path
  end
end
