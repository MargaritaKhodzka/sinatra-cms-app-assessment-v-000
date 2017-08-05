class ClientCourse <ActiveRecord::Base
  belongs_to :client
  belongs_to :course
end
