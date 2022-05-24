Rails.application.routes.draw do
  root to: 'conversions#index'
  resources :conversions, only: %i[index create new show]
end
