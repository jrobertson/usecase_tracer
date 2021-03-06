Gem::Specification.new do |s|
  s.name = 'usecase_tracer'
  s.version = '0.1.2'
  s.summary = 'Traces the methods used for each use case and returns them as raw Polyrex documents'
  s.authors = ['James Robertson']
  s.files = Dir['lib/usecase_tracer.rb']
  s.add_runtime_dependency('indented-tracer', '~> 0.1', '>=0.1.5')
  s.signing_key = '../privatekeys/usecase_tracer.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/usecase_tracer'
end
