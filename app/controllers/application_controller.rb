
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #create
  #get
  get '/articles/new' do
    erb :new
  end

  #post
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
  #redirecting to the article.id to see that specific one

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    # binding.pry
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy
  end


end
