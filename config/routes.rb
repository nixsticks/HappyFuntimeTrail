HappyFuntimeTrail::Application.routes.draw do
  root 'pages#index'
  get '/about' => 'pages#about'
  get '/help' => 'pages#help'

  get '/current' => 'users#current', as: :current
  resources :users
  get '/signup' => 'users#new'

  resources :sessions, only: [:new, :create, :destroy]
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#delete'

  resources :trails do
    resources :pins do 
      collection { post :sort }
      collection { get :order }
    end
  end

  post '/trails/:id/start' => 'trails#start', as: :trail_start
  
  get '/trails/:id/order_pins' => 'trails#order_pins', as: :trail_order_pins

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
