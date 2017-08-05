class Course < ActiveRecord::Base
  belongs_to :user
  has_many :client_courses
  has_many :clients, through: :client_courses

  def self.valid_params?(params)
    return !params[:name].blank? && !params[:date].blank? && !params[:num_of_hours].blank? && !params[:status].blank?
  end
end
