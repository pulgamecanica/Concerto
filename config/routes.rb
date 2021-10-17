Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home"
  scope module: 'admins' do
    resources :home_pages
    resources :pages
  end
end
