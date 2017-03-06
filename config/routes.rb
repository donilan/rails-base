Rails.application.routes.draw do
  devise_for :users, controllers: {
               sessions: 'users/sessions',
               confirmations: 'users/confirmations',
               passwords: 'users/passwords',
               registrations: 'users/registrations',
               unlocks: 'users/unlocks',
               omniauth: 'users/omniauth'
             }
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
