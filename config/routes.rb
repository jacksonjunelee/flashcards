Rails.application.routes.draw do
  root 'welcome#index'
  resources :flashcards, except: ['index']
  resources :quiz, only: ['index']

  get '/quiz/check_answer' => 'quiz#check_answer'
  get '/quiz/next/:id' => 'quiz#next'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
