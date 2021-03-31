Rails.application.routes.draw do
  devise_for :user_admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope :api do 
    scope :v1 do
      devise_for :users,
             path: '',
             path_names: {
               sign_in: 'users/sessions',
               sign_out: 'logout',
               registration: 'users'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }
      resources :books, only: [:index, :show] do
        collection do
         resources :book_suggestions, only: [:create], path: 'suggestions'
        end
      end
      resources :rents, only: [:index, :create] 
    end
  end
end
