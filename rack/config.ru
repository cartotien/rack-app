require_relative 'middleware/runtime'
require_relative 'middleware/logger'
require_relative 'app'

use Runtime
use Logger
run App.new
