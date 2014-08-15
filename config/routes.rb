WarszawaHotel::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  DynamicRouter.load

  scope "(:locale)" do


    get 'about-hotel', to: 'about#hotel', as: :source_about_hotel

    get 'rooms', to: 'about#rooms', as: :source_about_rooms

    get 'prices', to: 'about#prices', as: :source_about_prices

    get 'services', to: 'services#index', as: :source_services

    get 'restaurant', to: 'about#restaurant', as: :source_restaurant

    get 'contact-us', to: 'contact#index', as: :source_contact

    get '/order', to: 'contact#create_message', as: :source_order

    root to: 'home#index'
  end

  get "*path", to: 'error#not_found', defaults: { error_code: 404 }

  # namespace :cms  do content_blocks :rooms end
  #
  # namespace :cms  do content_blocks :galleries end
  #
  # namespace :cms  do content_blocks :vacancies end
  #
  # #mount_bcms_page_comments
  #
  # namespace :cms  do content_blocks :services end
  #
  # namespace :cms  do content_blocks :articles end
  #
  # namespace :cms  do content_blocks :banners end
  #
  # mount BcmsKcfinder::Engine => '/bcms_kcfinder'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  #mount_browsercms
end
