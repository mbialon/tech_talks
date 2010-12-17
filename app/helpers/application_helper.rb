module ApplicationHelper
  def render_markdown(str)
    sanitize(Maruku.new(str).to_html)
  end
  
      def logo
      	return image_tag("rails.png", :alt => "Tech Talks", :class => "round")
    end
    
end
