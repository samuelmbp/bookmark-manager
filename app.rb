require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :create_bookmark
  end

  post '/bookmarks' do
    BookMark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = BookMark.all
    erb :bookmarks
  end

  run! if app_file == $0
end