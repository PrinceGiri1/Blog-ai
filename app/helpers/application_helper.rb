module ApplicationHelper
  def time_ago time
    "#{time_ago_in_words(time)} ago"
  end

  def status_conversion status, truthy: "Use", falsy: "Not in Use"
    if status
      truthy
    else
      falsy
    end
  end
  def publish_status_conversion status, truthy: "Publish", falsy: "Unpublish"
    if status
      truthy
    else
      falsy
    end
  end



end
