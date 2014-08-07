module ApplicationHelper
  def page
    if params[:controller].index('devise').nil? && (params[:controller] != 'error' && params[:action] != 'not_found')
      if params[:page_id]
        Page.find(params[:page_id])
      end
    end
  end

  def page_type
    if page.nil?
      :other_route

    elsif params[:source_route] != true
      :db_page
    else
      :source_route
    end
  end

  def main_menu
    res = Menu.where(id: 1)
    return res.first if res && res.respond_to?(:first)
  end

  def footer_menu
    res = Menu.where(id: 2)
    return res.first if res && res.respond_to?(:first)
  end

  def about_menu
    res = Menu.where(id: 3)
    return res.first if res && res.respond_to?(:first)
  end


end
