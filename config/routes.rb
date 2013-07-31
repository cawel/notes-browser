NotesViewer::Application.routes.draw do

  root :to => 'application#welcome'

  get 'browser/:path'                           => 'application#browse', :constraints => {:path => /.*/}, :as => :browser

  get 'pages/edit/:path'                          => 'pages#edit', :constraints => {:path => /.*/}, :as => :edit_page
  put 'pages/update/:path'                        => 'pages#update', :constraints => {:path => /.*/}, :as => :update_page

end
