Bloccit::Application.routes.draw do
  get "comments/create"
  get "comments/index"
  get "comments/new"
  get "comments/show"
  get "comments/edit"
  get "topics/index"
  get "topics/new"
  get "topics/show"
  get "topics/edit"
  devise_for :users
    resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

   resources :summaries, only: [:show, :new]
  
   
  get 'about' => 'welcome#about'

    root to: 'welcome#index'
end
