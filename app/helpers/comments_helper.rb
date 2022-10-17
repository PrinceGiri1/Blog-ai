module CommentsHelper
	def time time
		"#{time_ago_in_words ((time) || Time.now)} ago"
  end
end
