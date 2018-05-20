require "#{MRUBY_ROOT}/lib/mruby/source"

MRuby::Gem::Specification.new('mruby-ini') do |spec|
  spec.license = 'MIT'
  spec.authors = 'OKUMURA Takahiro'
  spec.version = '0.0.1'

  spec.add_dependency 'mruby-string-ext'
  spec.add_dependency 'mruby-kernel-ext'
  spec.add_dependency 'mruby-onig-regexp'
  if MRuby::Source::MRUBY_VERSION >= '1.4.0'
    spec.add_dependency 'mruby-io', core: 'mruby-io'
  else
    spec.add_dependency 'mruby-io'
  end
end
