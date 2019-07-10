Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'



  post 'login/index'

  root 'signup#main'

  post 'signup/main' => 'signup#main'
  # post 'signup/register' => 'signup#register'
  get 'verify/index' => 'verify#index'

  get 'search/location' => 'location#index'

  get 'search/fetch_rate' => 'fetch_rate#fetch_rate'
  get 'logout/index' => 'logout#index'

end
