require_relative '../../config/environment'
require "pry"
class ApplicationController < Sinatra::Base

  # set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to('/posts')
  end

  get '/posts/new' do
      erb :new
  end

  post '/posts' do

    x = Post.create(name: params[:name], content: params[:content])
    redirect to('/')
  end

  get "/posts" do
    @posts = Post.all
    erb :index
  end

  get "/posts/:id" do



    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do


    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do


    x = Post.find_by(id: params[:id])
    x.update(name: params[:name], content: params[:content])
    @post = x
    erb :show

  end

  delete '/posts/:id/delete' do

    x = Post.find_by(id: params[:id])
    @id = x.name
    x.delete
    erb :delete

  end

end
