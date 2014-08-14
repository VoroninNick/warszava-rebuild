class AboutController < ApplicationController
  def hotel
    @title = 'Про готель //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''

    @about_page = Pages::AboutPage.first

  end

  def restaurant
    @title = 'РЕСТОРАН //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''

    @restaurant_page = Pages::Restaurant.first
  end

  def rooms
    @title = 'Номери //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''

    @rooms_page = Pages::RoomsList.first
    @rooms = Room.where(published: 't').order('id desc')
  end

  def prices
    @title = 'Ціни //Готель львів//Готель варшава//Готелі львова//Львів готель'
    @meta_description = ''
    @meta_keywords = ''
  end
end
