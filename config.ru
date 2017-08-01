require './config/environment'

use Rack::MethodOverride
use UsersController
use ClientsController
use CoursesController
run ApplicationController
