Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  post 'questions/answer/:id/:answer_id', to: 'questions#answer_question'
  resources :questions do
    resources :answers
  end
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
