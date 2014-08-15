class DynamicRouter
  def self.load
    WarszawaHotel::Application.routes.draw do
      #scope "(:locale)" do
      Page.all.each do |page|
        if !page.published
          next
        end
        #puts "Routing #{pg.name}"
        to = 'pages#show'
        if (page.controller && page.controller.length > 0) && (page.action && page.action.length > 0)
          to = "#{page.controller}##{page.action}"
        end

        page.translations_by_locale.keys.each do |locale|
          I18n.with_locale locale do
            get "#{page.full_path}", :to => to, defaults: { page_id: page.id, for_locale: locale, locale_missed_in_request_url: true }
            get "(:locale)#{page.full_path}", :to => to, locale: /#{locale.to_s}/, defaults: { page_id: page.id, locale: locale }
          end
        end

      end
      #end
    end

    # if Configuration.settings_hash["detect_locale_automatically"] == 'true'
    #
    # end
  end

  def self.reload
    WarszawaHotel::Application.routes_reloader.reload!
  end
end