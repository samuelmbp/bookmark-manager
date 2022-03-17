require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  
  post '/create_bookmark' do
    redirect '/create_bookmark'
  end

  get '/create_bookmark' do
    erb :create_bookmark
  end

  post '/delete_bookmark' do
    p 'SUCCESSFULLY DELETED'
    BookMark.delete(title: params['title'])
    redirect '/bookmarks'
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