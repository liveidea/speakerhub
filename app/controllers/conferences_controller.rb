class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]
  # GET /conferences
  # GET /conferences.json
  before_action :check_permissions, only: [:edit, :update, :destroy]
  def index
    @conferences = Conference.all
    filtering_params(params).each do |key, value|
      @conferences = @conferences.public_send(key, value) if value.present?
    end
    # @conferences = @conferences.sort_by_title(params[:title]) if params[:title].present?
    # @conferences = @conferences.sort_by_start_date(params[:start_date]) if params[:start_date].present?
    # @conferences = @conferences.sort_by_finish_date(params[:finish_date]) if params[:finish_date].present?
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
  end

  # POST /conferences
  # POST /conferences.json
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
    @my_conferences=Conference.where(user: current_user)
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
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

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to conferences_url, notice: 'Conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def filtering_params(params)
      params.slice(:title, :start_date, :finish_date)
    end

    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      #params[:conference]
      params.require(:conference).permit(:title, :description, :place, :start_date, :finish_date)
    end
    def check_permissions
      if current_user == @conference.user
        return true
      else
        redirect_to :root
        flash[:alert] = "You dont have permission to view this page!"
      end
    end
end
