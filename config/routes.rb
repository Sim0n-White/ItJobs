Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  root 'pages#itjobs'

  resources :employer_vacancies, except: %i[index]

  resources :cities do
    collection do
      get :load
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
