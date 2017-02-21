Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  if Rails.env.development?
    get 'exception' => 'dev#exception'
  end
end
