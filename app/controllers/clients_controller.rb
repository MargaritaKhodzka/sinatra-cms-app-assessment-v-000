class ClientsController < ApplicationController

  get '/clients' do
    if logged_in?
      @clients = Client.all
      erb :'/clients/clients'
    else
      redirect '/login'
    end
  end

  get '/clients/new' do
    if logged_in?
      @clients = Client.all
      @courses = Course.all
      erb :'/clients/new'
    else
      redirect '/login'
    end
  end

  post '/clients' do
    @client = Client.create(full_name: params[:full_name], age: params[:age], notes: params[:notes])
    @client.save
    redirect to "/clients/#{@client.id}"
  end

  get '/clients/:id' do
    @client = Client.find_by_id(params[:id])
    erb :'/clients/show'
  end

end
