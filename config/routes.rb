Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth', registrations: 'registrations' }
  root 'pages#itjobs'

  resources :administrations
  resources :employee_summaries
  resources :employer_vacancies do
    member do
      post :accept
      post :reject
    end
  end

  resources :cities do
    collection do
      get :load
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
