Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show' => 'users#show'
  root  'strolls#index'
  resources :strolls
  resources :favorites, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
