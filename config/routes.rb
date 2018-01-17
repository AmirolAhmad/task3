Rails.application.routes.draw do
  resources :lists do
    member do
      patch :soft_delete
    end
    resources :list_items
  end
end
