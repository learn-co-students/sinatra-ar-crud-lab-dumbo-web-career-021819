require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  # index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # new
  get '/articles/new' do
    erb :new
  end

  # create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  # show article info
  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end

  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  #delete that chet
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id].to_i)
    @article.destroy
    redirect to "/articles"
  end
end
