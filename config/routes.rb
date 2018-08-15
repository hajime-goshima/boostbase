Rails.application.routes.draw do
  root 'public#index'
  get '/', to: 'public#index', as: 'index'
  get '/article/:id', to: 'public#article', as: 'article'
  get '/tag/:id', to: 'public#tag', as: 'tag'
  get '/category/:id', to: 'public#category', as: 'category'

  namespace :admin do
    devise_for :users, class_name: "Admin::User", controllers: {
          confirmations: 'admin/users/confirmations',
          passwords: 'admin/users/passwords',
          registrations: 'admin/users/registrations',
          sessions: 'admin/users/sessions',
          unlocks: 'admin/users/unlocks'
    }
    post 'resource/upload', to: 'resource#upload', as: 'admin_upload'
    resources :basic_settings, except: :destroy
    resources :articles
    resources :tags
    resources :categories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
