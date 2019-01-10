Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'digital_invoice#index'
  
  post 'upload', to: "digital_invoice#upload"
  post '/download/file', to: 'digital_invoice#download', as: 'download_file'

end
