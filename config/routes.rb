Rails.application.routes.draw do



  get 'login/index'

  #root "signup#main"

  post 'signup/main' => 'signup#main'

  get 'search/location' => 'location#index'

  get 'search/fetch_rate' => 'fetch_rate#fetch_rate'

end
