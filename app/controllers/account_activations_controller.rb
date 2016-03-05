class AccountActivationsController < ApplicationController

  def edit
    @user = User.find_by(email: params[:email])
    if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
      render layout: 'layouts/application'
    else
      flash[:warning] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
