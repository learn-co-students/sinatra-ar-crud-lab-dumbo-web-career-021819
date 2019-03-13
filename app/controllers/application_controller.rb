
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    erb :index
  end

  #READING ALL FILES
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #CREATING
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #READING INDIVIDUAL FILE
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #UPDATING
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    Article.destroy(@article.id)
    redirect to "/articles"
  end

end
