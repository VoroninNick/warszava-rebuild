class ShowNewsPortlet < Cms::Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @show_news ||= Article.published.order("created_at DESC").limit(2)
  end
    
end
