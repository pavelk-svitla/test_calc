Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'commands/*.rb')].each { |file| require file }

module Commands
  AVAILABLE = ObjectSpace.each_object(::Class).select { |klass| klass < Base }
end
