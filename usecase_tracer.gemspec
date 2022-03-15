Gem::Specification.new do |s|
  s.name = 'usecase_tracer'
  s.version = '0.2.3'
  s.summary = 'Traces the methods used for each use case and ' + 
      'returns them as raw Polyrex documents'
  s.authors = ['James Robertson']
  s.files = Dir['lib/usecase_tracer.rb', 'data/weblet.txt']
  s.add_runtime_dependency('clipboard', '~> 1.3', '>=1.3.6')
  s.add_runtime_dependency('weblet', '~> 0.4', '>=0.4.0')
  s.add_runtime_dependency('indented-tracer', '~> 0.1', '>=0.1.5')
  s.signing_key = '../privatekeys/usecase_tracer.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/usecase_tracer'
end
