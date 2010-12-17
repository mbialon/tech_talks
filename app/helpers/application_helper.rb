module ApplicationHelper
  def render_markdown(str)
    sanitize(Maruku.new(str).to_html)
  end
  
      def logo
      	return image_tag("logo.png", :alt => "Tech Talks", :class => "round")
    end
    
    def trimDate(date)
      date.strftime("%d %b %Y")
    end
end
