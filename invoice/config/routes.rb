Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'digital_invoices#index'
  
  resources :digital_invoices,  only: [:index] do
  	post :upload, on: :collection 
  	post :download, on: :member
  end
end
