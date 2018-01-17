Rails.application.routes.draw do
  resources :lists do
    member do
      delete :delete
      patch :restore
    end
    resources :list_items
  end
  get 'trash' => "lists#trash", as: "trash"
end
