class Client < ActiveRecord::Base
  belongs_to :user
  has_many :client_courses
  has_many :courses, through: :client_courses

  def self.valid_params?(params)
    return !params[:full_name].blank? && !params[:age].blank? && !params[:notes].blank?
  end
end
