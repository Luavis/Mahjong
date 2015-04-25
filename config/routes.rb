Rails.application.routes.draw do

  get '/' => 'welcome#index'
  get '/!/record/monthly' => 'record#month'


end
