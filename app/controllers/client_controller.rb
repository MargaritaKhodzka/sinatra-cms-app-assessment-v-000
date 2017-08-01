class ClientController < ApplicationController

  get '/clients' do
    @clients = Client.all
    erb :'/clients/clients'
  end

  get '/clients/new' do
    erb :'/clients/new'
  end

  post '/clients' do
    Client.create(full_name: params[:full_name], age: params[:age], notes: params[:notes])
    redirect "/clients/#{@client.id}"
  end

  get 'clients/:id' do
    @client = Client.find_by_id(params[:id])
    erb :'/clients/show'
  end

end
