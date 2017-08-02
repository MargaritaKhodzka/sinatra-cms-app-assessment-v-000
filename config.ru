require './config/environment'

use Rack::MethodOverride
use CoursesController
use ClientsController
use UsersController
run ApplicationController
