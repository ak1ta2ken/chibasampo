Rails.application.routes.draw do
  root  'strolls#index'
  resources :strolls
end
