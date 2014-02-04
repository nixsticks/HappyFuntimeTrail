HappyFuntimeTrail::Application.routes.draw do
  root 'pages#index'
  get '/about' => 'pages#about', as: :about
  get '/help' => 'pages#help', as: :help

  get '/current' => 'users#current', as: :current
  get '/abandon' => 'users#abandon', as: :abandon

  resources :users
  get '/signup' => 'users#new'
  post '/checkin' => 'users#checkin', as: :checkin

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

  get '/trails/:id/add_media' => 'trails#add_media', as: :trail_add_media

  get '/trails/:id/win' => 'trails#win', as: :trail_win

  delete '/delete_text' => 'medias#delete_text'
  delete '/delete_audio' => 'medias#delete_audio'
  delete '/delete_video' => 'medias#delete_video'
  delete '/delete_image' => 'medias#delete_image'

  get '/test' => "pages#test"

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
