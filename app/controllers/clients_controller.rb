require 'pry'

class ClientsController < ApplicationController

  get '/clients' do
    redirect_if_not_logged_in
    @clients = current_user.clients
    erb :'/clients/clients'
  end

  get '/clients/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @clients = current_user.clients
    erb :'/clients/new'
  end

  post '/clients' do
    redirect_if_not_logged_in
    @client = current_user.clients.create(params[:client])
    @client.user = current_user
    @client.save
    @client.courses << current_user.courses.create(name: params[:new_course])

    redirect '/clients'
  end

  get '/clients/:id' do
    redirect_if_not_logged_in
    @client = current_user.clients.find_by_id(params[:id])
    erb :'/clients/show'
  end

  get '/clients/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @client = current_user.clients.find_by_id(params[:id])
    @courses = current_user.courses.all
    erb :'/clients/edit'
  end

  patch '/clients/:id' do
    redirect_if_not_logged_in
    @client = current_user.clients.find(params[:id])
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
    @client = current_user.clients.find_by_id(params[:id])
    if logged_in?
      @client.delete
      redirect '/clients'
    else
      redirect '/login'
    end
  end

end
