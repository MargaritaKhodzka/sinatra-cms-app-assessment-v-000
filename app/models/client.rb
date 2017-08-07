class Client < ActiveRecord::Base
  belongs_to :user
  has_many :client_courses
  has_many :courses, through: :client_courses

  validates :full_name, :age, :notes, presence: true
end
