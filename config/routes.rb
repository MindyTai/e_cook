Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only:[] do
  #   collection do
  #     get :favorites
  #   end
  # end
  
  root "recipes#index"
  get "/other", to: "recipes#other"
  resources :recipes do
    collection do
      get :my
    end
  end
end
