class ServicesController < ApplicationController
  def index
    @title = 'Послуги //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''

    @services = Service.where(published: 't')
  end
end
