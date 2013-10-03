Messagehub::Application.routes.draw do
  get  "messages/", to: "messages#index"
  post "messages/", to: "messages#create"
  get  "messages/:id", to: "messages#show"
  root 'messages#index'
end
