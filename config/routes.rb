Rails.application.routes.draw do
root 'users#index'

#wclick "create new user" -> #new displays creation page
get '/users/new' => 'users#new'
#click "show user" -> #show displays show page for that user
get '/users/:id' => 'users#show'
#click "edit user"-> #edit displays edit page for that user
get '/users/:id/edit' => 'users#edit'

#new user form submit -> #create method adds to db
post '/users' => 'users#create'
#delete user form submit -> #destroy method deletes that user from db
delete '/users/:id' => 'users#destroy'
#edit user form submit -> #update method updates that user info in db
patch '/users/:id' => 'users#update'
end
