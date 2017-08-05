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
    @course = current_user.courses.create(name: params[:name], date: params[:date], num_of_hours: params[:num_of_hours], status: params[:status])
    @course.user = current_user
    @course.clients << current_user.clients.create(full_name: params[:new_client])
    @course.save
    redirect "/courses"
  end

  get '/courses/:id' do
    redirect_if_not_logged_in
    @course = current_user.courses.find_by_id(params[:id])
    erb :'/courses/show'
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
    @course.save
    redirect "/courses/#{@course.id}"
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
