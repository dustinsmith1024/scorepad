Scorepad::Application.routes.draw do

  get "page/index"
  get "page/contact"

  resources :users do
    resources :games
  end

  root :to => 'page#index'

end
