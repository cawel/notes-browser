Rails.application.routes.draw do
  root to: 'application#browse'

  get 'browser/:path'       => 'application#browse', :constraints => { path: /.*/ }, as: :browser
end
