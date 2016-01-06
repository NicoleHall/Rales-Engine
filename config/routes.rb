Rails.application.routes.draw do

    namespace :api do
     namespace :v1 do
      resources :customers, except: [:new, :edit ], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoices'
          get 'transactions'
        end
      end
      resources :transactions, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoice'
        end
      end
      resources :merchants, except: [:new, :edit], defaults: { format: :json }  do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'items'
          get 'invoices'
        end
      end
      resources :items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoice_items'
          get 'merchant'
        end
      end
      resources :invoices, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'transactions'
          get 'invoice_items'
          get 'items'
          get 'customer'
          get 'merchant'
        end
      end
      resources :invoice_items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoice'
          get 'item'
        end
      end
    end
  end

  # resources :merchants, except: [:new, :edit], defaults: { format: :json } do
  #   resources :items
  #   get "find", to: "merchant_finder#show"
  # end


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
