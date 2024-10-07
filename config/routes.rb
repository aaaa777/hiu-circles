Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'static_pages/help'
  devise_for :users

  root to: 'static_pages#home'

  scope :circle_hub do
    root to: 'static_pages#home', as: :circle_hub_root
    resources :circles do
      member do
        resource :circle_dashboard, only: [] do
          get :index, action: :index
          get :member_list, action: :member_list
          get :member_show, action: :member_show
          get :role_index, action: :role_index
          get :role_new, action: :role_new
          get :role_edit, action: :role_edit
          get :request_pending, action: :request_pending
          get :request_index, action: :request_index
          get :notification_setting, action: :notification_setting

          get :activity_log, action: :activity_log
        end

        resources :requests
      end
    end
  end

  scope :admin_hub do
    resources :dashboard
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
