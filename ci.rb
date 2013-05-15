require 'fileutils'
def sh *args
  puts args
  exit false unless system(*args)
end

sh "bundle --path=vendor/bundle" unless ARGV[0] =~ /travis/

case ARGV[0]
when 'travis_deploy'
  unless ENV['TRAVIS_PULL_REQUEST'] == 'true'
    sh 'wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
    sh 'git remote add heroku git@heroku.com:heartrails-rails4-example.git'
    sh 'echo "Host heroku.com" >> ~/.ssh/config'
    sh 'echo "   StrictHostKeyChecking no" >> ~/.ssh/config'
    sh 'echo "   CheckHostIP no" >> ~/.ssh/config'
    sh 'echo "   UserKnownHostsFile=/dev/null" >> ~/.ssh/config'
    sh 'heroku keys:clear'
    sh 'yes | heroku keys:add'
    sh 'yes | git push heroku master'
  end
else
  FileUtils.rm "db/test.sqlite3" if File.exist? "db/test.sqlite3"
  FileUtils.cp "config/database.yml.example", "config/database.yml"
  sh "bundle exec rake db:migrate ci:setup:rspec spec RAILS_ENV=test"
end
