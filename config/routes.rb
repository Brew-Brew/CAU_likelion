Rails.application.routes.draw do
  #resources :posts
  # home 관련 route
  get 'home/index'
  get 'home/contact'

  #post 관련 route
  get 'team/posts' => 'post#index', as: 'posts'
  post 'team/posts' => 'post#create'
  get 'team/posts/new' => 'post#new', as: 'new_post'
  get 'team/posts/edit' => 'post#edit', as: 'edit_post'
  get 'team/posts/:id' => 'post#show', as: 'post'
  put 'team/posts/:id' => 'post#update'
  delete 'team/posts/:id' => 'post#destroy'

  # user 관련 route
  get 'user/index'

  # 팀관련 route
  get 'teams/:teamid' => 'team#index'

  #root 연결
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
