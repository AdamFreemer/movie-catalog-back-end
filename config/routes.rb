Rails.application.routes.draw do
  resource :imports, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :movies
    end
  end
end
