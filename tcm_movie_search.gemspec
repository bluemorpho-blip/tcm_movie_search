
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tcm_movie_search/version"

Gem::Specification.new do |spec|
  spec.name          = "tcm_movie_search"
  spec.version       = TcmMovieSearch::VERSION
  spec.authors       = ["'Ronald Stephens'"]
  spec.email         = ["'rstephens@bluemorpho.cc'"]

  spec.summary       = %q{Search TCM website for movies with a variety of attributes.}
  spec.description   = %q{Gives the ability to search TCM (Turner Classic Movies) website using a
      a variety of different options to filter the search for movies based on title, year released, genre(s), actor(s) or director.}
  spec.homepage      = "http://www.bluemorpho.cc"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["http://www.bluemorpho.cc"] = spec.homepage
    spec.metadata["http://www.bluemorpho.cc"] = "TODO: Put your gem's public repo URL here."
    spec.metadata["http://www.bluemorpho.cc"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
