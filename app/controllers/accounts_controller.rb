class AccountsController < ApplicationController
  def index
    @accounts = Account.all.page(params[:page]).per(9)
  end

  def show
    @account = current_user.account
  end
end
