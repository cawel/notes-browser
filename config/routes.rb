NotesViewer::Application.routes.draw do

  root :to => 'application#welcome'

  match 'browser/:level1/:level2/:level3/:level4' => 'application#browse', :constraints => { :level4 => /[^\/]+/ }, :as => :browser
  match 'browser/:level1/:level2/:level3'         => 'application#browse', :constraints => { :level3 => /[^\/]+/ }, :as => :browser
  match 'browser/:level1/:level2'                 => 'application#browse', :constraints => { :level2 => /[^\/]+/ }, :as => :browser
  match 'browser/:level1'                         => 'application#browse', :as => :browser

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
