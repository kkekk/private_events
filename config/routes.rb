Rails.application.routes.draw do
  root 'events#index'
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  resources :events
  resources :users, only: [:show] do
    member do
      post :attend_event
    end
  end
end
