require 'json'
require 'byebug'

Dir.glob('./*.rb').each { |r| require r}
Dir.glob('./tasks/*.rake').each { |r| load r}

task default: %w[intercom:invite_customers]