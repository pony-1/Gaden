Rails.application.routes.draw do

  resources :topics do
    collection do
      post :confirm
    end
  end
  get 'topics' => 'topics#index'
  root 'top#index'
end
