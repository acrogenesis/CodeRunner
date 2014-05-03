CodeRunner::Application.routes.draw do
  root 'codes#index'

  resources 'codes'
  get 'codes/submit/:id', to: 'codes#submit'
end
