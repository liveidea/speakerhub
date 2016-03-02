class StaticPagesController < ApplicationController
  def home
  	# @users = User.all
    # if params[:theme].present? do
    @users = User.joins(:themes).where(themes: {name: params[:theme].strip}) if params[:theme].present?
    @theme = params[:theme]
    # @users = User.joins(:themes).where(themes: {name: params[:theme].capitalize.strip}) if params[:theme].present?
  end

  def help
  end

  def about
  end

  def contact
  end
end
