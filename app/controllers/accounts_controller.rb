class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all.page(params[:page]).per(6)
    @accounts = @accounts.name_search(params[:f_name]) if params[:f_name].present?
    @accounts = @accounts.joins(:themes).where(themes:
   { id: params[:theme] }) if params[:theme].present?
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @my_speeches = @account.user.speeches.page(params[:page_1]).per(20)
    @my_conferences = @account.user.conferences.page(params[:page_2]).per(20)
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  def my_requests
    if params[:type]
      @my_requests = current_user.account.requests.where(status: params[:type])
    else
      @my_requests = current_user.account.requests
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    # params[:account]
    params.require(:account).permit(:f_name, :l_name, :facebook_account, :phone, :skype_account, :image, :city_id, theme_ids: [])
  end

  def check_permissions
    if current_user == @account.user
      return true
    else
      redirect_to :root
      flash[:alert] = 'You dont have permission to view this page!'
    end
  end
end
