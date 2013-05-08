desc "create test data"
task :test_data => :environment do
  users = FactoryGirl.create_list(:user, 10, password: "hogehoge")
  posts = FactoryGirl.create_list(:post, 30){|p| p.user = users.sample}
  FactoryGirl.create_list(:comment, 100){|c| c.user = users.sample; c.post = posts.sample }
  puts "done."
end
