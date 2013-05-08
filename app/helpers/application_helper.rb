module ApplicationHelper
  # http://stackoverflow.com/a/9944554/683157
  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end
end
