Rails.application.routes.draw do

  resources :users
  root to: 'static_pages#home'
  match '/about', to: 'static_pages#about', via: 'get'

  get 'static_pages/home'

  get 'static_pages/about'

    # strains routes
  get     '/strains',                             to: 'strains#index'
  get     '/strains/new',                         to: 'strains#new'
  post    '/strains',                             to: 'strains#create'

  get     '/strains/:id',                         to: 'strains#show'
  get     '/strains/:id/edit',                    to: 'strains#edit',             as: "edit_strain"
  put     '/strains/:id',                         to: 'strains#update'
  delete  '/strains/:id',                         to: 'strains#destroy'
  get     '/strains/:id/toggle_completed',        to: 'strains#toggle_completed'
  patch   '/todos/:id',                           to: 'todos#update'

match 'strains/:id/toggle_completed', to: 'todos#toggle_completed', via: 'get'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
