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
      @courses = Course.all
      erb :'/clients/new'
    else
      redirect '/login'
    end
  end

  post '/clients' do
    @client = Client.create(params[:client])
    if !params[:new_course].empty?
      @client.courses << Course.create(name: params[:new_course])
    end
    @client.save
    redirect to "/clients/#{@client.id}"
  end

  get '/clients/:id' do
    @client = Client.find_by_id(params[:id])
    erb :'/clients/show'
  end

  get '/clients/:id/edit' do
    @client = Client.find(params[:id])
    @courses = Course.all
    erb :'/clients/edit'
  end

  patch '/clients/:id' do
    @client = Client.find(params[:id])
    @client.update(params[:client])
    if !params[:course][:name].empty?
      @client.courses.create(params[:course])
    end
    @client.save
    redirect "/clients/#{@client.id}"
  end

end
