Rails.application.routes.draw do
  get '/' => 'welcome#index'

  get '/!/record' => 'record#month'

  get '/!/record/:year' => 'record#year', constraints: { year: /\d{4}/}, as: 'record_year'
  get '/!/record/:year/q/:quater' => 'record#quater', constraints: { quater: /\d/ }, as: 'record_quater'
  get '/!/record/:year/:month' => 'record#month', constraints: { year: /\d{4}/, month: /\d{1,2}/}, as: 'record_month'

  get '/!/record/today' => 'record#day', as: 'record_today'
  get '/!/record/:year/:month/:day' => 'record#day', constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: 'record_day'
end
