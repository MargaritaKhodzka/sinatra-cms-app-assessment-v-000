require './config/environment'

use Rack::MethodOverride
use UserController
use ClientController
run ApplicationController
