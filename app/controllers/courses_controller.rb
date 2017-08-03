class CoursesController < ApplicationController

  get '/courses' do
    redirect_if_not_logged_in
    @courses = Course.all
    erb :'/courses/courses'
  end

  get '/courses/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'/courses/new'
  end

  post '/courses' do
    redirect_if_not_logged_in
    unless Course.valid_params?(params)
      redirect "/courses/new?error=invalid course info"
    end
    @course = Course.create(params[:course])
    redirect "/courses"
  end

  get '/courses/:id' do
    redirect_if_not_logged_in
    @course = Course.find_by_id(params[:id])
    erb :'/courses/show'
  end

  get '/courses/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @course = Course.find_by_id(params[:id])
    erb :'/courses/edit'
  end

  patch '/courses/:id' do
    redirect_if_not_logged_in
    @course = Course.find_by_id(params[:id])
    unless Course.valid_params?(params)
      redirect "/courses/#{@course.id}/edit?error=invalid course info"
    end
    @course.update(params.select{|c|c=="name" || c=="date" || c=="num_of_hours" || c=="status"})
    @course.save
    redirect "/courses/#{@course.id}"
  end

  delete '/courses/:id/delete' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @course = Course.find_by_id(params[:id])
    if logged_in?
      @course.delete
      redirect '/courses'
    else
      redirect '/login'
    end
  end

end
