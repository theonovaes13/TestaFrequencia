class UsersController < ApplicationController
  load_and_authorize_resource class: User

  def show
    @user = current_user
  end

  def index
  end

  def delete
  end

  def create
  end

  def edit
    @user = current_user
  end

  def update
  end
  private

  def user_params
    params.require(:user).permit(:matricula )

  end
end

