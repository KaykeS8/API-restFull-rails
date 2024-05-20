Rails.application.routes.draw do
  resources :kinds
  resources :auths, only: [:create]
  api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.api+json; version=1"}) do
    resources :contacts do 
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resources :phones
  
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end
  api_version(:module => "v2", :parameter => {:name => "version", :value => "v2"}) do
    resources :contacts do 
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resource :phones, only: [:show]
      resource :phone, only: [:update, :create, :destroy]
      resource :phones, only: [:show], path: 'relationships/phones'
  
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end
end