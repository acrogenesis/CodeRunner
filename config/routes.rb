CodeRunner::Application.routes.draw do
  root 'codes#index'

  resources 'codes'
end
