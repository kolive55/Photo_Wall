require 'pry'
# Homepage (Root path)
helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end

get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all.limit(5)
  erb :'/songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'/songs/new'
end

get '/users/sign_up' do
  @user = User.new
  if @user.save
    session[:user_id] = @user.id
    redirect to("/")
  else
    erb :'/users/sign_up'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login'do
  @user = User.find_by(user_name: params[:user_name], password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect 'users/profile'
  else
    erb :'users/login'
  end
end

post '/users' do
  @user = User.new(
    user_name: params[:user_name],
    password: params[:password],
    )
    if @user.save
      redirect '/songs'
    else
      erb :'users/sign_up'
    end
end

post '/songs' do
  @song = current_user.songs.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'/songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'/songs/show'
end

get '/users/profile' do
  @user = current_user
  erb :'users/profile'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/users/login'
end
