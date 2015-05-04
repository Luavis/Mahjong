Rails.application.routes.draw do
  get '/' => 'welcome#index'

  get '/!/record' => 'record#month', as: 'record'

  get '/!/record/:year' => 'record#year', constraints: { year: /\d{4}/}
  get '/!/record/:year/q/:quater' => 'record#quater', constraints: { quater: /\d/ }
  get '/!/record/:year/:month' => 'record#month', constraints: { year: /\d{4}/, rank: /\d{1,2}/}

  get '/!/record/today' => 'record#day'
  get '/!/record/:year/:month/:day' => 'record#day', constraints: { year: /\d{4}/, rank: /\d{1,2}/, day: /\d{1,2}/}
end
