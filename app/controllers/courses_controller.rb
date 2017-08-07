class CoursesController < ApplicationController

  get '/courses' do
    redirect_if_not_logged_in
    @courses = current_user.courses
    erb :'/courses/courses'
  end

  get '/courses/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @courses = current_user.courses
    erb :'/courses/new'
  end

  post '/courses' do
    redirect_if_not_logged_in
    @course = current_user.courses.build(name: params[:name], date: params[:date], num_of_hours: params[:num_of_hours], status: params[:status])
    @course.user = current_user
    if @course.save
      @course.clients << current_user.clients.create(full_name: params[:new_client], age: params[:new_client], notes: params[:new_client])
      redirect '/courses'
    else
      erb :'/courses/new'
    end
  end

  get '/courses/:id' do
    redirect_if_not_logged_in
    if @course = current_user.courses.find_by_id(params[:id])
      erb :'/courses/show'
    else
      redirect '/courses'
    end
  end

  get '/courses/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @course = current_user.courses.find_by_id(params[:id])
    erb :'/courses/edit'
  end

  patch '/courses/:id' do
    redirect_if_not_logged_in
    @course = current_user.courses.find_by_id(params[:id])
    @course.update(params.select{|c|c=="name" || c=="date" || c=="num_of_hours" || c=="status"})
    if !params[:client][:name].blank?
      @course.clients.create(params[:client])
    end
    if @course.save
      redirect "/courses/#{@course.id}"
    else
      erb :'/courses/edit'
    end
  end

  delete '/courses/:id/delete' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @course = current_user.courses.find_by_id(params[:id])
    if logged_in?
      @course.delete
      redirect '/courses'
    else
      redirect '/login'
    end
  end

end
