class HomeController < ApplicationController
  def index
    @title = 'Готельно-ресторанний комплекс Варшава | Головна //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_keywords = 'готелі у львові, готельно-ресторанний комплекс, Warszawa Hotel & Restaurant, Малехів, банкети, Варшава, готель-ресторан, весілля, польська та українська кухня, Львів - Рава Руська'
    @meta_description = 'готелі у львові, готельно-ресторанний комплекс, Warszawa Hotel & Restaurant, Малехів, банкети, Варшава, готель-ресторан, весілля, польська та українська кухня, Львів - Рава Руська'

    @home_banners = Banner.where(published: 't')

    @home_services = Service.where(published: 't', display_home: 't').order('updated_at desc').limit(4)

    @services_page = Page.find(9)

    @home_gallery_images = Pages::HomePage.first.home_gallery_images

    


  end
end
