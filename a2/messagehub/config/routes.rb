Messagehub::Application.routes.draw do
  get  "messages/", to: "messages#index"
  post "messages/", to: "messages#create"
  get  "messages/:id", to: "messages#show"
 # get "messages/show"
 # get "messages_controller/index"
 # get "messages_controller/create"
 # get "messages_controller/show"

  root 'messages#index'
end
