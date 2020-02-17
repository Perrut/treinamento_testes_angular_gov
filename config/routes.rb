Rails.application.routes.draw do
  resources :answers
  post 'answers/answer/:id/:answer_id', to: 'answers#answer_question'
  
  resources :questions
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
