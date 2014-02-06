class HomeController < ApplicationController
  def index

  end

  def login
    username = params[:username]
    password = params[:password]

    return redirect_to controller: 'game', action: 'index' unless Player.find_by_credentials(username, password).nil?

    redirect_to action: index
  end
end
