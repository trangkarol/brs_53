class RequestsController < ApplicationController
  before_action :logged_in_user
  before_action :load_request, only: [:destroy, :update]
  before_action :load_user, only: [:edit, :update, :index]

  def index
    @requests = Request.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
    @request = Request.new
    @categories = Category.all
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t "view.request.send_success"
    else
      flash[:danger] = t "view.request.send_not_success"
    end
    redirect_to :back
  end

  def update
    if @request.update_attributes request_params
       flash[:success] = t "view.request.update_success"
    else
      flash[:danger] = t "view.request.update_not_success"
    end
    redirect_to :back
  end

  def destroy
    if @request.destroy
      flash[:success] = t "view.request.cancel_success"
    else
      flash[:danger] = t "view.request.cancel_not_success"
    end
    redirect_to :back
  end

  private

  def load_user
    @user = User.find_by id: current_user.id
    return if @user
    flash[:warning] = t "app.controllers.not_found_user"
    redirect_to :back
  end

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:warning] = t "app.controllers.not_found_request"
    redirect_to :back
  end

  def request_params
    params.require(:request).permit(:title, :author, :category_id).
      merge user_id: current_user.id
  end
end
