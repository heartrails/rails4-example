module UsersHelper
  def link_to_user(user)
    link_to user.username, user if user
  end
end
