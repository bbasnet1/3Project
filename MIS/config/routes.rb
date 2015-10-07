Rails.application.routes.draw do
  get 'history/index'

  get 'history/create'

  get 'history/edit'

  get 'condition/index'

  get 'condition/create'

  get 'condition/edit'

  get 'appointment/index'

  get 'appointment/create'

  get 'appointment/edit'

  get 'labwork/index'

  get 'labwork/create'

  get 'labwork/edit'

  get 'prescription/index'

  get 'prescription/create'

  get 'prescription/edit'

=begin
  get 'labstaff/new'
  get 'labstaff/index'
  get 'labstaff/login'
  get 'labstaff/register'
  get 'labstaff/main'
  post 'labstaff/login_submit'
  post 'labstaff/register_submit'

  get 'pharmacist/new'
  get 'pharmacist/index'
  get 'pharmacist/login'
  get 'pharmacist/register'
  get 'pharmacist/main'
  post 'pharmacist/login_submit'
  post 'pharmacist/register_submit'

  get 'admin/main'
  get 'admin/login'
  post 'admin/login_submit'
  
  get 'hspstaffs/new'
  get 'hspstaffs/index'
  get 'hspstaffs/login'
  get 'hspstaffs/register'
  get 'hspstaffs/main'
  post 'hspstaffs/login_submit'
  post 'hspstaffs/register_submit'

  get 'nurses/new'
  get 'nurses/index'
  get 'nurses/login'
  get 'nurses/register'
  get 'nurses/main'
  post 'nurses/login_submit'
  post 'nurses/register_submit'

  get 'doctors/new'
  get 'doctors/index'
  get 'doctors/login'
  get 'doctors/register'
  get 'doctors/main'
  post 'doctors/login_submit'
  post 'doctors/register_submit'

  get 'patients/new'
  get 'patients/index'
  get 'patients/login'
  get 'patients/register'
  get 'patients/main'
  get 'patients/delete'
  post 'patients/login_submit'
  post 'patients/register_submit'
  

  
  get 'welcome/main'
=end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#main'
   match '/:controller(/:action(/:id))(.:format)', via: [:get, :post]#automatically route to controller and action based on URL
  # Example of regular route:
     #get 'patients/new' => 'patients#new'
     #get 'patients/patient_login' => 'patients#patient_login'
	 
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
   #  resources :doctors

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
