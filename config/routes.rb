Rails.application.routes.draw do
  resources :payloads, only: %i[create show], param: :uuid, format: :json
end
