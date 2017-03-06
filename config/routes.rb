Rails.application.routes.draw do
  devise_for :users, controllers: {
               confirmations: 'users/confirmations',
               passwords: 'users/passwords',
               registrations: 'users/registrations',
               unlocks: 'users/unlocks',
               omniauth: 'users/omniauth'
             }, skip: [:sessions]
  as :user do
    get 'signin', to: 'users/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    get 'signout', to: 'users/sessions#destroy', as: :destroy_user_session
  end
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
