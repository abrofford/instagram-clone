class UsersController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
      if user.save
        #todo redirct to photos index page
        session[:user_id] = user.id
        redirect_to "/photos", notice: "Thank you for signing up!"
      else
        redirect_to "/"
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find (params[:id])
      if user.update(user_params)
        redirect_to edit_user_path(user.id)
      else
        redirect_to "/"
      end
  end


  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
