Rails.application.routes.draw do

  get 'api/stories', to: 'stories#index'
  post 'api/stories', to: 'stories#create'

  get 'api/stories/:story_id/pages/:page_id', to: 'pages#show_page_in_story'
  post 'api/stories/:story_id/pages/:parent_id/next', to: 'pages#save_page_in_story'

end
