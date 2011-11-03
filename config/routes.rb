Newsite::Application.routes.draw do

  match '/post/:name' => 'post#show'

  root :to => 'home#index'
end
