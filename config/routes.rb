Rails.application.routes.draw do



  get 'login/index'

  #root "signup#main"

  post 'signup/main' => 'signup#main'

end
