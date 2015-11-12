Rails.application.routes.draw do
  devise_for :users

  get 'reports/subjects', to: 'reports#subjects', as: :report_subjects

  resources :teachers do
    get :subjects
  end

  resources :students do
    get :subjects
  end

  root to: "visitors#index"
end
