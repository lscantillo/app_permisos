class UserRolesController < ApplicationController
  def edit_roles
    @user = User.find(params[:id])
  end

  def update_roles
    @user = User.find(params[:id])
    if @user.update(user_role_params)
      redirect_to users_path, notice: 'Roles actualizados exitosamente.'
    else
      render :edit_roles
    end
  end

  private

  def user_role_params
    params.require(:user).permit(role_ids: [])
  end

end
