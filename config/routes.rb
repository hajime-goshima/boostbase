Rails.application.routes.draw do
  resources :demos
  post '/upload', to: 'demos#upload', as: 'upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
