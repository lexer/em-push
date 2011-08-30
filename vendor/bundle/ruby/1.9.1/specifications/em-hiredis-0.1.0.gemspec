# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{em-hiredis}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Martyn Loughran}]
  s.date = %q{2011-05-04}
  s.description = %q{Eventmachine redis client using hiredis native parser}
  s.email = [%q{me@mloughran.com}]
  s.homepage = %q{http://github.com/mloughran/em-hiredis}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{em-hiredis}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Eventmachine redis client}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hiredis>, ["~> 0.3.0"])
    else
      s.add_dependency(%q<hiredis>, ["~> 0.3.0"])
    end
  else
    s.add_dependency(%q<hiredis>, ["~> 0.3.0"])
  end
end
