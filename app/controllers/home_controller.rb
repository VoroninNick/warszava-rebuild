class HomeController < ApplicationController

  def index
    @title = 'Готельно-ресторанний комплекс Варшава | Головна //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_keywords = 'готелі у львові, готельно-ресторанний комплекс, Warszawa Hotel & Restaurant, Малехів, банкети, Варшава, готель-ресторан, весілля, польська та українська кухня, Львів - Рава Руська'
    @meta_description = 'готелі у львові, готельно-ресторанний комплекс, Warszawa Hotel & Restaurant, Малехів, банкети, Варшава, готель-ресторан, весілля, польська та українська кухня, Львів - Рава Руська'

    @home_banners = Banner.where(published: 't')

    @home_services = Service.where(published: 't', display_home: 't').order('updated_at desc').limit(4)

    @services_page = Page.find(9)

    @home_gallery_images = Pages::HomePage.first.home_gallery_images

    @home_page = Pages::HomePage.first

    @articles = Article.where(published: 't').order('id desc').limit(2)

    @articles_page = Page.find(6)

  end

  def test
    # file = Gem.loaded_specs['railties'].gem_dir.split('/')
    # file = file.first(file.count - 0).join('/')
    # rails_root = Rails.root
    # rails_root_path_arr = rails_root.to_s.split('/')
    # rails_root_path_length = rails_root_path_arr.count
    # root_path =  ( "/.." * (rails_root_path_length - 1) )
    # final_path = ".#{root_path}#{file}/lib"
    # require  final_path + '/rails.rb'
    # require final_path + "/rails/generators/actions.rb"

    require 'rails/generators'

    #Rails::Generators.invoke('model', %w(MyGithubPage username:string) )
    Rails::Generators.invoke("active_record:model", ['MyGithubPage', "list_order:string", "name:string"], {migration: true, timestamps: true})

   # include Rails::Generators


    render inline: 'hello'
  end
end