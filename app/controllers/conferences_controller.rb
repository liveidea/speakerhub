class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy, :make_checked, :send_email]
  # GET /conferences
  # GET /conferences.json
  before_action :check_auth, only: [:new, :create]
  before_action :check_permissions, only: [:edit, :update, :destroy]
  def index
    @conferences = Conference.all.page(params[:page]).per(10)
    filtering_params(params).each do |key, value|
      @conferences = @conferences.public_send(key, value) if value.present?
    end
    @conferences = @conferences.title(params[:title]) if params[:title].present?
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @request = @conference.requests.build
    @active_conference_requests = Request.all.where(conference_id: params[:id], status: 0)
    @speeches = @conference.speeches.page(params[:page]).per(20)

    @comments = @conference.comments.order(created_at: :desc)
    @comment = @conference.comments.build

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @conference = Conference.new
  end


  def edit
  end

  def create
    @conference = Conference.new(conference_params)
    @conference.user = current_user
    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render :show, status: :created, location: @conference }

      else
        format.html { render :new }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_conferences
    @my_conferences=Conference.where(user: current_user).page(params[:page]).per(20)
  end

  def update
    respond_to do |format|
      if @conference.update(conference_params)
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference }
      else
        format.html { render :edit }
        format.json { render json: @conference.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to my_conferences_conferences_url, notice: 'Conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def speeches
    @speeches = Conference.find(params[:id]).speeches.page(params[:page]).per(5)
    respond_to do |format|
      format.js {}
    end
  end
  # def send_email
  #
  #   UserMailer.request_send(current_user, @conference, params[:email_text]).deliver_now
  #   redirect_to :back
  # end

  private
    def filtering_params(params)
      params.slice(:start_date, :finish_date)
    end

    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      #params[:conference]
      params.require(:conference).permit(:title, :description, :place, :start_date, :finish_date, :avaliable)
    end
    def check_permissions
      if current_user == @conference.user
        return true
      else
        redirect_to :root
        flash[:alert] = "You dont have permission to view this page!"
      end
    end
    def check_auth
      if user_signed_in?
        true
      else
        redirect_to new_user_registration_path
        flash[:alert] = "Please sign up to create conferences"
      end
    end
end
