Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'api/v1/users/sessions',
               sign_out: 'logout',
               registration: 'api/v1/users'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  post '/api/v1/rents', to: 'rents#create'
  get '/api/v1/rents', to: 'rents#index'
end
