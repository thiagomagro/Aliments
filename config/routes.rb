Aliments::Application.routes.draw do
#  get "home/index"
  root :to => "home#index"

  match 'grupos/listar' => 'grupos#list', :via => [:get, :post]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  
  match 'usuarios/lugares/:id' => 'usuarios#lugares'  
  match 'usuarios/lugares', :via => [:get, :post]
  match 'usuarios/update_lugares/:id' => 'usuarios#update_lugares'
  match 'tipo_medidas/add_tipo/:id' => 'tipo_medidas#add_tipo'
  match 'tipo_medidas/importar/:id' => 'tipo_medidas#importar'
  match 'tipo_medidas/importar'
  match 'tipo_medidas/add_tipo_medida_medidas/:id' => 'tipo_medidas#add_tipo_medida_medidas'

  match 'marcas/marca_alimento/' => 'marcas#marca_alimento', :via => [:get, :post]
  match 'grupos/adicionar_grupo/:id' => 'grupos#adicionar_grupo', :via => [:get, :post]

  match 'alimentos/search'
  match 'alimentos/search_form', :via => [:get, :post]
  match 'alimentos/list', :via => [:get, :post]
  
  match 'alimentos_usda/search'
  match 'alimentos_usda/search_form', :via => [:get, :post]
  match 'alimentos_usda/importar'
  match 'alimentos/importar', :via => [:get, :post]
  match 'alimentos_usda/list', :via => [:get, :post]
  match 'alimentos_usda/importar/:id' => 'alimentos_usda#importar', :via => [:get, :post]
  
  match 'refeicao/listar' => 'refeicaos#list', :via => [:get, :post]
  match 'refeicao/adicionar_alimento/:id'=> 'refeicaos#adicionar_alimento', :via => [:get, :post]
  match 'busca/index' => 'busca#index', :via => [:get, :post]

  
  match 'sessions/fb'=>'sessions#fb'
  match 'sessions/new'=>'sessions#new'
  match 'sessions/create'=>'sessions#create'
  match 'sessions/destroy'=>'sessions#destroy'
  
  resources :alimentos, :alimentos_usda, :usuarios, :tipo_medidas, :medidas, :marcas, :grupos, :lugares, :usuario_lugars, :refeicaos, :componentes
  #match 'sessions/:action' => ""
  

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

