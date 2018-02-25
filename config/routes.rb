Rails.application.routes.draw do
  #device 관련 route
  devise_for :users
  #resources :posts
  # home 관련 route
  get 'home/index'
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

  # user 관련 route
  get 'user/index'

  # 팀관련 route
  get 'teams/:teamid' => 'team#index'
  post 'teams/admin' => 'team#admin', as: 'admin'
  post 'teams/student' => 'team#student', as: 'student'
  get 'secret' => 'team#secret'

  #root 연결
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
