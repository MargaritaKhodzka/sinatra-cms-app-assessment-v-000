class Course < ActiveRecord::Base
  belongs_to :client

  def self.valid_params?(params)
    return !params[:name].blank? && !params[:date].blank? && !params[:num_of_hours].blank? && !params[:status].blank?
  end
end
