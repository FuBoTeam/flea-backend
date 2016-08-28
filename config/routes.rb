Rails.application.routes.draw do
	root "products#index"
  devise_for :users

  namespace :account do
  	resources :products
  	resources :testpage
  end

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
