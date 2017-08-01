require './config/environment'

use Rack::MethodOverride
use UserController
use ClientController
use CourseController
run ApplicationController
