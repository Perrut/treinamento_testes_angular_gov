Rails.application.routes.draw do
  resources :answers
  post 'questions/answer/:id/:answer_id', to: 'questions#answer_question'
  
  resources :questions
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
