Rails.application.routes.draw do
  resources :characters#, as: :chars

  resources :items

  resources :reputations do
  end

  resources :achievements
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
