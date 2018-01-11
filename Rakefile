Bundler.require

Dir.glob('./modules/*.rb').each { |r| require r}
Dir.glob('./models/*.rb').each { |r| require r}
Dir.glob('./tasks/*.rake').each { |r| load r}

task default: %w[intercom:invite_customers]