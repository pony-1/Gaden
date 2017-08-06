Rails.application.routes.draw do

  resources :topics do
    collection do
      post :confirm
    end
  end
  get 'topics' => 'topics#index'
  root 'top#index'

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
