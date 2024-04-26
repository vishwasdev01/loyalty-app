class UsersController < ApplicationController
  def index
    @users = filter_users
  end

  private

  def filter_users
    if params[:user_search]
      User.where('email LIKE ?', "%#{params[:user_search]}%")
    else
      User.all
    end
  end
  
end
