module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Speakerhub"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def youtube_video(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", width: "560", height: "315", :allowfullscreen => "", :frameborder => "0")
  end
end
