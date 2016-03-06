class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :change_status]

  def new
    @conference = Conference.find(params[:conference_id])
    @request = @conference.requests.build
    redirect_to :back
  end
  def create
    @conference = Conference.find(params[:conference_id])
    @request = @conference.requests.build(request_params)
    @request.account = current_user.account
    respond_to do |format|
      if @request.save
        h = JSON.generate({ 'email' => @conference.user.email,
                            'f_name' => @request.account.f_name,
                            'l_name' => @request.account.l_name,
                            'message' => @request.message,
                            'conf_title' => @conference.title})
        MailWorker.perform_async(h, 1)
        format.html { redirect_to @conference, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @conference }
        format.js
      else
        format.html { render :template => "conferences/show" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  def destroy
    @request.destroy
    redirect_to :back, notice: "Request was successfully deleted"
  end

  def update
    @request.update(request_params)
    @active_conference_requests = Request.all.where(conference_id: params[:conference_id], status: 0)
    # redirect_to :back
    # @active_conference_requests = Request.all.where(conference_id: params[:conference_id], status: 0)
    respond_to do |format|
      format.html
      format.js
    end
  end
  def change_status
      # @request.update_attribute(:status, params[:status].to_i)
    redirect_to :back
  end
  private
  def request_params
    params.require(:request).permit(:answer, :message, :status)
  end
  def set_request
    if params[:id]
      @request = Request.find(params[:id])
    else
      @request = Request.find(params[:request_id])
    end
  end


end
