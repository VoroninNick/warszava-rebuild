class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_locale
  def check_locale
    if params[:controller].index('devise').nil?
      locale = params[:locale]
      if request.path[0..5] != '/admin'
        if !locale || params[:locale_missed_in_request_url] == true
          preferred_locale = http_accept_language.compatible_language_from(I18n.available_locales)
          #render inline: "#{preferred_locale}"
          if preferred_locale
            locale = preferred_locale



          else
            locale = I18n.default_locale

          end
        end

        if locale != params[:locale] || params[:locale_missed_in_request_url] == true
          #redirect_to url_for(locale: locale)
          redirect_to "/#{locale}#{request.path}"
          #render inline: "/#{locale}#{request.path}"
        end
        I18n.locale = locale
      end
    end
  end
end
