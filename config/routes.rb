Rails.application.routes.draw do
  resources :followships

  get '/users', to: 'users#index'
  get '/users/(:id)', to: 'users#show'
  
  post '/clock-in', to: 'sleeping_times#clock_in'
  post '/clock-out', to: 'sleeping_times#clock_out'
  get '/followed-user-sleep-duration/(:id)', to: 'followships#sleep_duration'

  get '/', to: proc { [200, {}, ['']] }
end
