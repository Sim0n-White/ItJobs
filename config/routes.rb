Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth', registrations: 'registrations' }
  root 'pages#itjobs'

  resources :loader, :path => 'loaderio-683036b8dfe4eb55bc6ab0298ca7c63f' do
  end


  resources :administrations do
    collection do
      get :unaccepted_vacancies
      get :unaccepted_summaries
    end
    member do
      get :show_vacancy
      get :show_summary
    end
  end
  resources :employee_summaries do
    member do
      post :accept
      post :reject
    end
  end
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
