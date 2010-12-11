module ApplicationHelper
  def render_markdown(str)
    sanitize(Maruku.new(str).to_html)
  end
end
