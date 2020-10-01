Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
}
  resources :users, only: [:show]

  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :new, :create]
  end
end

