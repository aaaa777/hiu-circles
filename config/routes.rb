Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'static_pages/help'
  devise_for :users

  root to: 'static_pages#hiu_hub'

  scope :circle_hub do
    root to: 'static_pages#home', as: :circle_hub_root
    resources :circles do
      member do
        resource :circle_admin, only: [] do
          get :index
          get :member_list
          get :member_show
          get :role_index
          get :role_new
          get :role_edit
          get :request_pending
          get :request_index
          get :notification_setting

          get :activity_log
          get :wip
        end

        resources :from_user_requests
      end
    end
  end

  scope :admin_hub do
    resources :site_admin
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
