Vkontakte::Application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'index'
      post 'index'
      get 'second_step', as: "reg"
      get 'next_step', as: "reg1"
      post 'next_step', as: "reg1"
      get 'online_update'
    end
  end

  post 'user/second_step', as: "reg"
  get 'user/users', as: 'users'
  get 'user/:id' => 'user#show'
  
  get 'friends/request_to_friends', as: 'add_friend'
  get 'friends/confirmation', as: 'confirmation'
  get 'friends/delete', as: 'delete_confirmation'
  get 'friends/requests', as: 'req'
  get 'friends/index', as: 'friends'


  get 'message/new', as: 'new_mess'
  post 'message/sen_mess', as: 'send_mess'
  get 'message/show', as: 'mess_show'
  get 'message/index', as: 'messages'
  

  
  #post 'user/second_step'
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

  root to: "user#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
