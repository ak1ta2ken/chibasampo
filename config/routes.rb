Rails.application.routes.draw do
  get 'strolls/ganbarou' => 'strolls#ganbarou'
  get 'strolls/people' => 'strolls#people'
  resources :strolls do
    resources :comments
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show' => 'users#show'
  root  'strolls#chibasampo'
  resources :strolls
  resources :favorites, only: [:create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :favorites
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
