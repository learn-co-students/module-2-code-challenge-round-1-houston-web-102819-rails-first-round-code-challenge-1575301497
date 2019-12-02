Rails.application.routes.draw do
  
  
  resources :powers
  resources :heroines

  # resources :powers, only: [:index]
  # resources :heroines, only: [:index]  

end
