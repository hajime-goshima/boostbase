Rails.application.routes.draw do
  namespace :admin do
    resources :basic_settings, except: :destroy
    resources :articles
    resources :tags
    resources :categories
  end
  resources :demos
  post '/upload', to: 'demos#upload', as: 'upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
