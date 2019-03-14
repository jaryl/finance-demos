Rails.application.routes.draw do

  root to: redirect('/compound_interest')

  resource :compound_interest, only: [:show]

end
