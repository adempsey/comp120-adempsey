Messagehub::Application.routes.draw do
  # get "messages/index"
  post "messages/", to: "messages#create"
 # get "messages/show"
 # get "messages_controller/index"
 # get "messages_controller/create"
 # get "messages_controller/show"

  root 'messages#index'
end
