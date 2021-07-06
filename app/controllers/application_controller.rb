
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

   get '/articles' do 
  	@articles = Article.all
  	erb :index
  end

#CREATE
  get '/articles/new' do 
  	erb :new
  end 


#SHOWS A SPECIFIC ARTICLE VIA THE ID
  get '/articles/:id' do 
  	@article = Article.find(params[:id])

  	erb :show
  end

#ACCEPTS THE FORM FROM #NEW AND CREATES AN ARTICLE PAGE
  post '/articles' do 
  	@article = Article.create(params)
  	redirect to "/articles/#{ @article.id }"
  end


  get '/articles/:id/edit' do 
  	@article = Article.find(params[:id])
  	erb :edit
  end

  patch '/articles/:id' do 
  	params.delete("_method")
  	@article = Article.find(params[:id])
  	@article.update(params)
  	redirect to "/articles/#{ @article.id }"
  end

  delete '/articles/:id' do 
  	@article = Article.find(params[:id])
  	Article.destroy(@article.id)
  	redirect to '/articles'
  end



end
