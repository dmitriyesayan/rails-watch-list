Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/create'
  get 'lists/new'
  get 'lists/show'
  get 'bookmarks/index'
  get 'bookmarks/create'
  get 'bookmarks/new'
  get 'bookmarks/shoe'
  get 'bookmarks/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :new,:create, :show ] do
    resources :bookmarks, only: [ :index, :new, :create, :show ]
  end

  resources :bookmarks, only: [ :destroy ]

end
