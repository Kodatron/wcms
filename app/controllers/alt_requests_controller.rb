class AltRequestsController < ApplicationController
  before_action :set_alt_request, only: [:update, :show]
  before_action :login_required
  before_action :check_admin, only: [:update]

  def new
    @alt_request = AltRequest.new
  end

  def create
    @alt = current_user.alts.find(params[:alt_request][:alt_id])
    @alt_request = AltRequest.new(alt_request_params)

    if current_user.alt_requests << @alt_request
      flash[:notice] =  "Request successfully sent!"
      render :js => "window.location = '#{user_settings_path(tab: :alts)}'"
    else
      respond_to do |format|
        format.json { render json: @alt_request.errors.full_messages, status: 422 }
      end
    end
  end

  def show
    render layout: "layouts/admin"
  end

  def approve_or_decline
    @alt_request = AltRequest.find(params[:alt_request_id])

    @interactor = HandleAltRequest.call(
      document: @alt_request,
      user: current_user,
      alt: @alt_request.alt,
      profile: current_user.profile,
      status: params[:status],
      reason: params[:reason]
    )
    unless @interactor.success?
      flash[:warning] = "Something went wrong.."
      redirect_to admin_alt_requests_path
    else
      flash[:notice] = "Request has been successfully approved."
      redirect_to admin_alt_requests_path
    end
  end

  private
  def set_alt_request
    @alt_request = AltRequest.find(params[:id])
  end

  def alt_request_params
    params.require(:alt_request).permit(:user_id, :alt_id, :reason)
  end
end
