#encoding: utf-8

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = [Pages::AboutPage, Pages::HomePage, Banner, BannerImage, Gallery, SitemapRecord, User, Menu, HomeGalleryImage, AboutPageGalleryImage, RoomGalleryImage, ServiceGalleryImage, FormConfig, Order]

  [Service, Room, Article, Vacancy, HtmlBlock, Page, MenuItem ].each do |model|
    config.included_models += [model, model::Translation]
  end

  ["Services", "AboutPage", "HomePage", "Restaurant", "RoomsList"].each do |model|
    config.included_models += ["Pages::#{model}", "Pages::#{model}::Translation"]
  end

  root = Tree::TreeNode.new('navigation_static_tree')


  config.navigation_static_links = root
  root << Tree::TreeNode.new('pages', title: 'Сторінки')
  root << Tree::TreeNode.new('articles', title: 'Публікації')
  root << Tree::TreeNode.new('services', title: 'Сервіси')
  root << Tree::TreeNode.new('rooms', title: 'Номери')
  root << Tree::TreeNode.new('vacancies', title: 'Вакансії')
  root << Tree::TreeNode.new('form_config', title: 'Форми')
  root << Tree::TreeNode.new('navigation', title: 'Навігація')
  root << Tree::TreeNode.new('users', title: 'Користувачі')









  pages = root['pages']
  pages << Tree::TreeNode.new('all', { title: 'Всі', link: "/admin/page" } )
  pages << Tree::TreeNode.new('home_page', { title: 'Головна', link: '/admin/pages~home_page/1' } )
  pages << Tree::TreeNode.new('about_page', { title: 'Про нас', link: '/admin/pages~about_page/1' } )
  pages << Tree::TreeNode.new('rooms_list', { title: 'Номери', link: '/admin/pages~rooms_list/1' } )
  pages << Tree::TreeNode.new('restaurant', { title: 'Ресторан', link: '/admin/pages~restaurant/1' } )
  pages << Tree::TreeNode.new('services', { title: 'Послуги', link: '/admin/pages~services/1' } )



  articles = root['articles']
  articles << Tree::TreeNode.new('all', { title: 'Всі статті', link: '/admin/article' } )
  #articles << Tree::TreeNode.new('useful_articles', title: 'Корисні статті')
  #useful_articles = articles['useful_articles']
  #useful_articles << Tree::TreeNode.new('all', { title: 'Всі', link: "/admin/article?source_route=true&utf8=✓&query=article" } )

  #articles << Tree::TreeNode.new('news', title: 'Новини')
  #news = articles['news']
  #news << Tree::TreeNode.new('all', { title: 'Всі', link: "/admin/article?source_route=true&utf8=✓&query=article" } )

  services = root['services']
  services << Tree::TreeNode.new('all', { title: 'Всі сервіси', link: '/admin/service' } )

  services = root['rooms']
  services << Tree::TreeNode.new('all', { title: 'Всі номери', link: '/admin/room' } )

  services = root['vacancies']
  services << Tree::TreeNode.new('all', { title: 'Всі вакансії', link: '/admin/vacancy' } )


  form_config = root['form_config']
  form_config << Tree::TreeNode.new('order_form_config', { title: 'Контакти', link: '/admin/form_config/1/edit' } )
  form_config << Tree::TreeNode.new('order_history', { title: 'Контакти - історія', link: '/admin/order' } )


  root_navigation = root['navigation']
  root_navigation << Tree::TreeNode.new('order_form_config', { title: 'меню', link: '/admin/menu' } )
  root_navigation << Tree::TreeNode.new('order_history', { title: 'пункти меню', link: '/admin/menu_item' } )

  root_users = root['users']
  root_users << Tree::TreeNode.new('users_users', {title: 'Користувачі', link: '/admin/user'})

end
