class Course < ActiveRecord::Base
  belongs_to :user
  has_many :client_courses
  has_many :clients, through: :client_courses

  validates :name, presence: true
end
