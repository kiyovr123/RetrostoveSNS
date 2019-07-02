Rails.application.routes.draw do
  post "users/logout"=>"users#logout"
  get "users/index" =>"users#index"
  get 'new' => "users#new"
  post "users/create" =>"users#create"
  get "login" => "users#login_form"
  post "users/login" =>"users#login"
  get 'posts/index'=>"posts#index"
  get '/' => "home#top"
  get "users/show/:id"=>"users#show"
  post "posts/new"=>"posts#new"
  get "posts/:id/edit"=>"posts#edit"
  post "posts/:id/destroy"=>"posts#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
