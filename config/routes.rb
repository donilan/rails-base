Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :admin do
    root 'home#index'
  end

  namespace :mobile do
    root 'home#index'
  end

  if Rails.env.development?
    get 'exception' => 'dev#exception'
  end
end
