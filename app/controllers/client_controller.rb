class ClientController < ApplicationController

  get '/clients' do
    @clients = Client.all
    erb :'/clients/clients'
  end

end
