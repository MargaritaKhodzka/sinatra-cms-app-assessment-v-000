class Client < ActiveRecord::Base
  belongs_to :user
  has_many :courses
  validates :full_name, :age, :notes, presence: true
end
