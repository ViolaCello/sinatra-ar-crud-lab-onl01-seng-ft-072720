
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

 

  

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id = params)
    erb :show
  end

  post '/articles' do
    # binding.pry
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
   # binding.pry
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
  
    article = Article.find_by(id: params[:id])
    # binding.pry
    new = {}
    new[:title]=params[:title]
    new[:content] = params[:content]
   # article.update(params[:title], params[:content])
   article.update(new)
       
    redirect "/articles/#{@article.id}"
  end


delete '/articles/:id' do 
  article = Article.find_by(id: params[:id])
  article.destroy
end

end