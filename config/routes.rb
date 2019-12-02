Rails.application.routes.draw do

  get('/heroines/error', { to: 'heroines#error'})
  resources(:powers)
  resources(:heroines) 
  
end
