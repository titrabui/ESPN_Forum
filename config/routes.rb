Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :messages do
    resources :comments
  end
  root 'messages#index'
end
