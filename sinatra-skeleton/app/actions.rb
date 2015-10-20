# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get '/users' do
  @users = User.all
end

get '/songs/new' do
  @song = Song.new
  erb :'/songs/new'
end

get '/users/sign_up' do
  @user = User.new
  erb :'/users/sign_up'
end

post '/users' do
  @user = User.new(
    user_name: params[:user_name],
    password: params[:password]
    )
    if @user.save
      redirect '/songs'
    else
      erb :'users/sign_up'
    end
end

post '/songs' do
  @song = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url],
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
