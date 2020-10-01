class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # def user_params
  # params.require(:user).permit(:nickname, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :profile)
  # end
end
