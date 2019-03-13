
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
    # binding.pry
  end

  #create --------------------------------------------------
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #read ----------------------------------------------------
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
    # binding.pry
  end

  #update ---------------------------------------------------
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article = Article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #delete ---------------------------------------------------
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect '/articles'
  end

end
