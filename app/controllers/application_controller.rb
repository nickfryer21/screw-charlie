class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # @return [PlayerSession]
  attr_accessor :current_session

  # @return [Hash]
  attr_accessor :model

  before_filter :load_resources, :authenticate_user!

  respond_to :html, :json, :xml

  def respond_with_empty_result
    respond_with({}, status: 204)
  end

  def load_resources
    self.current_session = PlayerSession.find_by_token(cookies[:screwcharlie_token])
  end

  def current_player
    Player.where(user_id: current_user.id).first!
  end
end
