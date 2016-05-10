Rails.application.routes.draw do

  root "stores#index"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :store, path: ":store", as: :store do
    resources :items, only: [:index, :show]
    # get "items", to: "items#index", as: :items
    # get "items/:id", to: "items#show", as: :item
  end

  get ":store", to: "stores#show", as: :store
  # get ":store/items/:id", to: "store/items#show", as: :store_item
  # get ":store/items", to: "store/items#index", as: :store_items
end
