Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'



  post 'login/index'

  root 'signup#main'

  post 'signup/main' => 'signup#main'
  # post 'signup/register' => 'signup#register'
  get 'verify/index' => 'verify#index'

end
