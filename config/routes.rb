Rails.application.routes.draw do
  devise_for :users
  #resources :posts
  # home 관련 route
  get 'home/index'
  get '/contact'=> 'home#contact'

  #post 관련 route
  get 'teams/:teamid/posts' => 'posts#index', as: 'posts'
  post 'teams/:teamid/posts' => 'posts#create'
  get 'teams/:teamid/posts/new' => 'posts#new', as: 'new_post'
  get 'teams/:teamid/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  get 'teams/:teamid/posts/:id' => 'posts#show', as: 'post'
  patch 'teams/:teamid/posts/:id' => 'posts#update'
  delete 'teams/:teamid/posts/:id' => 'posts#destroy', as: 'destroy'

  # user 관련 route
  get 'user/index'

  # 팀관련 route
  get 'teams/:teamid' => 'team#index'

  #root 연결
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
