class ServiceDisplayHomePortlet < Cms::Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @services_at_home = Service.published.where(:display_home => "t").order("created_at DESC")
  end
    
end