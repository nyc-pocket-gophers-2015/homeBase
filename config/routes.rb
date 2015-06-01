Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :tasks, :events, :rewards, :families, :members
  # You can have the root of your site routed with "root"
  root 'tasks#index'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  post "sessions/admin" => "sessions#admin"
  get "sessions/normal" => "sessions#normal_mode"

  post 'members/give_reward' => 'members#give_reward'
  post 'members/deny_reward' => 'members#deny_reward'

  post 'members/add_points' => 'members#add_points'
  post 'members/remove_points' => 'members#remove_points'

  post 'tasks/kid_complete' => 'tasks#kid_complete'
  post 'tasks/parent_complete' => 'tasks#parent_complete'
  post 'tasks/parent_delete' => 'tasks#parent_delete'
  post 'tasks/parent_redo' => 'tasks#parent_redo'
  post 'tasks/delete_task' => 'tasks#delete_task'
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
