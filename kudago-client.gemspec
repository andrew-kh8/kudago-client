# frozen_string_literal: true

require_relative "lib/kudago_client"

Gem::Specification.new do |spec|
  spec.name = "kudago-client"
  spec.version = KudagoClient::VERSION
  spec.authors = ["andrew-kh8"]
  spec.email = ["horolskyandrey@gmail.com"]

  spec.summary = "Ruby client for Kuda Go"
  spec.description = "Allows to get data from Kuda Go"
  spec.homepage = "https://github.com/andrew-kh8/kudago-client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.3"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/andrew-kh8/kudago-client"
  spec.metadata["changelog_uri"] = "https://github.com/andrew-kh8/kudago-client/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "faraday", "~> 2.13"
  spec.add_dependency "oj", "~> 3.16"

  # spec.add_development_dependency "rspec", "~> 3.0" # uncomment when use RSpec
  spec.add_development_dependency "standard", "~> 1.50.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
