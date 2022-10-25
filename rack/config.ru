require_relative 'middleware/runtime'
require_relative 'middleware/logger'
require_relative 'app'

use AppLogger
use Runtime
run App.new
