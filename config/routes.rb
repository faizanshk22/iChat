Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords'
  }



  
  root to: 'users#index'
  resources :users  do
    member do
      get 'profile'
    end
  end
  resources :chatrooms do
  resources :messages
  end  
 
end
