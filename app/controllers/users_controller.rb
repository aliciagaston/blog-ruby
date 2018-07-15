class UsersController < ApplicationController
  before_action :load_user
  def load_user
    @user = User.find params[:id]
  end

end
