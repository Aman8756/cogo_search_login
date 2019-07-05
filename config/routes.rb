Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'



  get 'login/index'

  root 'signup#main'

  post 'signup/main' => 'signup#main'
  # post 'signup/register' => 'signup#register'

end
