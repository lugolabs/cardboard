class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  before_action :require_login

  helper_method :current_user_boards

  private

  def current_user_boards
    @current_user_boards ||= current_user.all_boards.order(:title)
  end
end
