Rails.application.routes.draw do
  resources :events, only: [:index, :create] do
    member do
      get :best_seats
    end
    resources :reservations, only: :create
  end
end
