class Admin::RequestsController < ApplicationController
  before_action :verify_admin?
  before_action :load_request, only: [:destroy, :update]

  layout "admin"

  def index
    @request = Request.new
    @requests = Request.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @request.destroy
      flash[:success] = t "view.admin.delete_completed"
    else
      flash[:danger] = t "view.admin.delete_not_complete"
    end
    redirect_to admin_requests_path
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t "view.admin.action_success"
    else
      flash[:danger] = t "view.admin.action_not_completed"
    end
    redirect_to  admin_requests_path
  end

  private

  def request_params
    params.require(:request).permit :status
  end

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:warning] = t "view.admin.request_not_found"
    redirect_to admin_requests_path
  end

end
