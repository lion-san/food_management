Nofoodloss::Application.routes.draw do
  #get "wishes/index"
  match 'wishes',  to: 'wishes#index',  via: 'get'
  get   "wishes/edit_all"
  get   "wishes/new"
  match 'wishes', to: 'wishes#create',    via: 'post'
  match 'wishes',  to: 'wishes#update',  via: 'put'

  get "admin/users"
  get "admin/stocks"
  resources :item_statuses

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :items do
    member { 
      get :thumbnail
    }
  end

  resources :user_items do
    member { 
      get :thumbnail
    }
  end

  match 'stocks',  to: 'stocks#index',  via: 'get'
  match 'stocks/edit_all',  to: 'stocks#edit_all',  via: 'get'
  match 'stocks',  to: 'stocks#update',  via: 'put'
  match 'stocks',  to: 'stocks#destroy',  via: 'delete'
  get "stocks/index_all"
  get "stocks/sort_item"
  get "stocks/sort_by_category"

  resources :categories


  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/reset', to: 'users#reset',            via: 'get'
  match '/resetpass', to: 'users#resetpass',    via: 'post'

  #root 'static_pages#home'
  root 'sessions#new'
  get "static_pages/help"
  
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
