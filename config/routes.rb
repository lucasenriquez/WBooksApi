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
  get '/books/:page', to: 'books#index'
  get '/books/api/v1/books/:id', to: 'books#show'
end
