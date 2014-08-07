class NewsItemPortlet < Cms::Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @news_item ||= Article.published.find(params[:id])
    @news_random ||= Article.offset(rand(Article.count)).first(2)
  end
    
end