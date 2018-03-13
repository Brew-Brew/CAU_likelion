Rails.application.routes.draw do
  #device 관련 route +구글인증
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  #resources :posts
  # home 관련 route
  get 'home/index'
  get 'home/notyet' => 'home#notyet'
  #contact 관련 route
  get 'contact'=> 'home#contact'
  post 'contact/create' =>'home#create'
  get 'contact/complete' => 'home#complete'
  get 'contact/admincontact' => 'home#admincontact', as: 'contact_admin'
  get 'contact/admincshow/:contact_id' => 'home#admincshow'
  #post 관련 route
  get 'teams/:teamid/posts' => 'posts#index', as: 'posts'
  post 'teams/:teamid/posts' => 'posts#create'
  get 'teams/:teamid/posts/new' => 'posts#new', as: 'new_post'
  get 'teams/:teamid/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  get 'teams/:teamid/posts/:id' => 'posts#show', as: 'post'
  patch 'teams/:teamid/posts/:id' => 'posts#update'
  delete 'teams/:teamid/posts/:id' => 'posts#destroy', as: 'destroy'
  post 'teams/post/:post_id/like' => 'posts#like_toggle'

  #resources :posts
  resources :posts do
    resources :comments
  end


  # user 관련 route
  get 'users/:id' => 'user#index'
  post 'users/profileImage'=> 'user#create'

  # 팀관련 route
  get 'teams/:teamid' => 'team#index'
  post 'teams/admin' => 'team#admin', as: 'admin'
  post 'teams/student' => 'team#student', as: 'student'
  get 'secret' => 'team#secret'
  post 'selectTeam/:teamid' => 'team#selectTeam', as: 'team'
  get 'onlycau' => 'team#only_cau'


  #root 연결
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
