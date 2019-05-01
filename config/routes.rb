# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      namespace :User do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
        # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      end
    end
  end
end
