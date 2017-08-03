require 'pry'

class ClientsController < ApplicationController

  get '/clients' do
    redirect_if_not_logged_in
    @clients = Client.all
    erb :'/clients/clients'
  end

  get '/clients/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @courses = Course.all
    erb :'/clients/new'
  end

  post '/clients' do
    #binding.pry
    redirect_if_not_logged_in
    @client = Client.create(params[:client])
    if !params[:new_course].empty?
      @client.courses << Course.create(name: params[:new_course])
    end
    redirect '/clients'
  end

  get '/clients/:id' do
    redirect_if_not_logged_in
    @client = Client.find_by_id(params[:id])
    erb :'/clients/show'
  end

  get '/clients/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @client = Client.find_by_id(params[:id])
    @courses = Course.all
    erb :'/clients/edit'
  end

  patch '/clients/:id' do
    redirect_if_not_logged_in
    @client = Client.find(params[:id])
    unless Client.valid_params?(params)
      redirect "/clients/#{@client.id}/edit?error=invalid client"
    end
    @client.update(params.select{|c|c=="full_name" || c=="age" || c=="notes"})
    if !params[:course][:name].empty?
      @client.courses.create(params[:course])
    end
    @client.save
    redirect "/clients/#{@client.id}"
  end

  delete '/clients/:id/delete' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @client = Client.find_by_id(params[:id])
    if logged_in?
      @client.delete
      redirect '/clients'
    else
      redirect '/login'
    end
  end

end
