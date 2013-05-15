desc "create test data"
task :test_data => :environment do
  users = FactoryGirl.create_list(:user, 10, password: "hogehoge")
  posts = FactoryGirl.build_list(:post, 30, user: nil){|p| p.user = users.sample; p.save! }
  FactoryGirl.build_list(:comment, 100, user: nil, post: nil){|c| c.user = users.sample; c.post = posts.sample; c.save! }
  puts "done."
end

desc 'reset counters_cache column on every post records'
task :reset_counters_cache => :environment do
  Post.pluck(:id).each do |id|
    Post.reset_counters(id, :comments)
  end
end
