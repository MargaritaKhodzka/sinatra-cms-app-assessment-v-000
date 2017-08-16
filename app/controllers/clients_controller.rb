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
    @client = current_user.clients.build(full_name: params[:full_name], age: params[:age], notes: params[:notes])
    @client.user = current_user
    if @client.save
      @client.courses << current_user.courses.create(name: params[:new_course])
      redirect '/clients'
    else
      erb :'/clients/new'
    end
  end

  get '/clients/:id' do
    redirect_if_not_logged_in
    if @client = current_user.clients.find_by_id(params[:id])
      erb :'/clients/show'
    else
      redirect '/clients'
    end
  end

  get '/clients/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    if @client = current_user.clients.find_by_id(params[:id])
      @courses = current_user.courses
      erb :'/clients/edit'
    else
      redirect to '/clients'
    end
  end

  patch '/clients/:id' do
    redirect_if_not_logged_in
    if @client = current_user.clients.find_by_id(params[:id])
      @client.update(params.select{|c|c=="full_name" || c=="age" || c=="notes"})
      if !params[:course][:name].empty?
        @client.courses.create(params[:course])
      end
      if @client.save
        redirect "/clients/#{@client.id}"
      else
        erb :'/clients/edit'
      end
    else
      redirect to '/clients'
    end
  end

  delete '/clients/:id/delete' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @client = current_user.clients.find_by_id(params[:id])
    @courses = current_user.courses.all
    if logged_in?
      @client.delete
      redirect '/clients'
    else
      redirect '/login'
    end
  end

end
