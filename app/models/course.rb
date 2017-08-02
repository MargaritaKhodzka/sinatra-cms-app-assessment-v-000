class Course < ActiveRecord::Base
  belongs_to :client

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:date].empty? && !params[:num_of_hours].empty? && !params[:status].empty? 
  end
end
