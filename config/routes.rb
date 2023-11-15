Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :clients do
    collection do
      get :query
      post :query_from_file
      post :find_duplicate
    end
  end
end
