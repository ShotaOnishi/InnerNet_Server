Rails.application.routes.draw do
  resources :page_domains
  resources :page_tags
  resources :tags
  resources :pages
  resources :domains
  namespace :api, { format: 'json' }  do
    namespace :v1 do
      resources :pages do
        resources :tags
        collection do
          get 'find'
        end
      end
    end
  end
end
