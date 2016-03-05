class SpeechesController < ApplicationController
  before_action :set_speech, only: [:show, :edit, :update, :destroy, :maked_checked]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  # GET /speeches
  # GET /speeches.json
  def index
    @speeches = Speech.all.page(params[:page]).per(5) # creates an anonymous scope
    @speeches = @speeches.location(params[:place]) if params[:place].present?
    @speeches = @speeches.theme(params[:theme]) if params[:theme].present?
    @speeches = @speeches.joins(:theme).order('themes.name') if params[:sort_by_theme] ==  'on'
    @speeches = @speeches.order(:title) if params[:sort_by_title] ==  'on'
    @speeches = @speeches.order(:place) if params[:sort_by_city] ==  'on'
    @speeches = @speeches.order(:date ) if params[:sort_by_date] ==  'on'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @speeches}
      format.json { render json: @speeches}
    end
  end

  # GET /speeches/1
  # GET /speeches/1.json
  def show
    @comment = @speech.comments.build
    @comments = @speech.comments.order(created_at: :desc)
  end

  # GET /speeches/new
  def new
    @speech = Speech.new
  end

  # GET /speeches/1/edit
  def edit
  end

  # POST /speeches
  # POST /speeches.json
  def create
    @speech = Speech.new(speech_params)
    @speech.user = current_user
    @speech.user.account.themes << @speech.theme unless current_user.account.themes.include?(@speech.theme) 

    respond_to do |format|
      if @speech.save
        format.html { redirect_to @speech, notice: 'Speech was successfully created.' }
        format.json { render :show, status: :created, location: @speech }
      else
        format.html { render :new }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speeches/1
  # PATCH/PUT /speeches/1.json
  def update
    respond_to do |format|
      if @speech.update(speech_params)
        format.html { redirect_to @speech, notice: 'Speech was successfully updated.' }
        format.json { render :show, status: :ok, location: @speech }
      else
        format.html { render :edit }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /speeches/1
  # DELETE /speeches/1.json
  def destroy
    @speech.destroy
    respond_to do |format|
      format.html { redirect_to speeches_url, notice: 'Speech was successfully destroyed.' }
      format.json { head :no_content }
      format.json { render json: @speech }
    end
  end

  def my_speeches
    @my_speeches = Speech.where(user_id: current_user).page(params[:page]).per(5)
    @my_speeches = @my_speeches.location(params[:place]) if params[:place].present?
    @my_speeches = @my_speeches.theme(params[:theme]) if params[:theme].present?
    @my_speeches = @my_speeches.joins(:theme).order('themes.name') if params[:sort_by_theme] ==  'on'
    @my_speeches = @my_speeches.order(:title) if params[:sort_by_title] ==  'on'
    @my_speeches = @my_speeches.order(:place) if params[:sort_by_city] ==  'on'
    @my_speeches = @my_speeches.order(:date ) if params[:sort_by_date] ==  'on'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @speeches}
      format.json { render json: @speeches}
    end
  end

  def maked_checked
    @speech.available = !@speech.available
    @speech.save
    render json: @speech.to_json
    # respond_to do |format|
    #   format.js
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speech
      @speech = Speech.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render :file => "#{Rails.root}/public/404", :layout => false, :status => 404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speech_params
      params.require(:speech).permit(:title, :description, :place, :date, :image, :video,:theme_id,:conference_id, :available)
    end

    def check_permissions
      if current_user == @speech.user
        return true
      else
        redirect_to :root
        flash[:alert] = "You dont have permission to view this page!"
      end
    end
end
