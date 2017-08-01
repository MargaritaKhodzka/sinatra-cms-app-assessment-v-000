class CoursesController < ApplicationController

  get '/courses' do
    @courses = Course.all
    erb :'/courses/courses'
  end

  get '/courses/new' do
    erb :'/courses/new'
  end

  post '/courses' do
    @course = Course.create(params[:course])
    @course.save
    redirect to "/courses/#{@course.id}"
  end

  get '/courses/:id' do
    @course = Course.find_by_id(params[:id])
    erb :'/courses/show'
  end

  get '/courses/:id/edit' do
    @course = Course.find_by_id(params[:id])
    erb :'/courses/edit'
  end

  patch '/courses/:id' do
    @course = Course.find_by_id(params[:id])
    @course.update(name: params[:name], date: params[:course][:date], num_of_hours: params[:course][:num_of_hours], status: params[:status])
    @course.save
    redirect to "/courses/#{@course.id}"
  end

end
