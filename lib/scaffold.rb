generate(:scaffold, "user username:uniq crypted_password salt")
generate(:scaffold, "post user:belongs_to text:text url")
generate(:scaffold, "comment user:belongs_to post:belongs_to body")
generate(:controller, "sessions new create destroy")

route "root :to => 'posts#index'"

run 'rm app/assets/stylesheets/scaffolds.css.scss'

rake "db:migrate:reset"
