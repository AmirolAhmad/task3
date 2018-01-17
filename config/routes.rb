Rails.application.routes.draw do
  resources :lists do
    member do
      patch :soft_delete
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
