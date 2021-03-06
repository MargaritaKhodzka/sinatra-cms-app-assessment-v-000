require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "clienttracker"
  end

  get '/' do
    erb :'/index'
  end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error = You have to log in first"
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
      #memoization
    end
  end

end
