Rails.application.routes.draw do
  resources :users

  post '/clock-in', to: 'user_clocks#clock_in'
  post '/clock-out', to: 'user_clocks#clock_out'
  get '/followed-user-sleep-duration/(:id)', to: 'users#sleep_duration'

  get '/', to: proc { [200, {}, ['']] }
end
