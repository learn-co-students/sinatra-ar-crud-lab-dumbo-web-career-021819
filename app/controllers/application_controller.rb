
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do 
    @articles = Article.all
    erb :index
  end 
######################### NEW ################
  get '/articles/new' do
    erb :new
  end
######################## CREATE ##########################   
  post '/articles' do
    @article = Article.create(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end
######################## EDIT ###########################
  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)
    erb :edit
  end 

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end 
##################### DELETE ############################
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end 

end
