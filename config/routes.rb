Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'prototypes#index'

  resources :users, only: :show # ユーザーの詳細ページへのルーティングを追加

  resources :prototypes do
    member do
      delete :destroy # メンバールートとしてdestroyアクションを追加
    end
    resources :comments, only: [:create] # commentsリソースをネストしてcreateアクションを追加
  end
end
