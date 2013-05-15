module ApplicationHelper
  # http://stackoverflow.com/a/9944554/683157
  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end

  def link_to_back(*args)
    link_to args.shift, session[:location_to_back] || root_path, *args
  end
end
