Rails.application.routes.draw do
  scope '/fe' do
    get 'files' => 'frontend#files'
  end
  root 'frontend#index'

  defaults format: :json do
    resources :payloads, only: %i[create index show], param: :uuid
  end
end
