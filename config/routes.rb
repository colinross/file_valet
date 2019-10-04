Rails.application.routes.draw do
  root 'frontend#index'
  defaults format: :json do
    resources :payloads, only: %i[create show], param: :uuid
  end
end
