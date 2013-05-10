require 'fileutils'
system "bundle --path=vendor/bundle" unless ARGV[0] == 'travis'
FileUtils.rm "db/test.sqlite3" if File.exist? "db/test.sqlite3"
FileUtils.cp "config/database.yml.example", "config/database.yml"
exit system "bundle exec rake db:migrate ci:setup:rspec spec RAILS_ENV=test"
