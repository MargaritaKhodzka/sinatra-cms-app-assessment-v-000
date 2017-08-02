class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/clients'
    end

    @user = User.find_by_id(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/clients'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/create'
    else
      redirect to '/clients'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect to '/signup'
     else
       @user = User.create(username: params[:username], password: params[:password], email: params[:email])
       session[:user_id] = @user.id
       redirect '/clients'
     end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/clients'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/clients'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if session[:user_id] !=nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
