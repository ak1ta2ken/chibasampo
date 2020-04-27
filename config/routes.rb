Rails.application.routes.draw do
  post '/users/guest_sign_in', to: 'users#new_guest'
  get 'strolls/ganbarou' => 'strolls#ganbarou'
  get 'strolls/people' => 'strolls#people'
  get 'strolls/quiz' => 'strolls#quiz'
  get 'strolls/douki' => 'strolls#douki'
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
