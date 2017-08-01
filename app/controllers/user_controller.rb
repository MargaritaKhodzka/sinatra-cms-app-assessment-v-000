class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/clients'
    else
      erb :'/users/create'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect '/signup'
     else
       user = User.create(params)
       session[:user_id] = user.id
       redirect '/clients'
     end
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  end

end
