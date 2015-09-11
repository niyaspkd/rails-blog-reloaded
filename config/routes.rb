Rails.application.routes.draw do

  get 'sessions/new'

  get  'login' => 'sessions#new'
  post  'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/admin' => 'posts#admin'
  get '/admin/approoved_articles' => 'posts#approove_article'



  root "posts#index"





  resources :posts do
    resources :comments, only: [:create, :destroy]
    member do
    get  'author' => 'posts#unapprooved'
    get 'approoved' => 'posts#approoved'
 end
  end
end
