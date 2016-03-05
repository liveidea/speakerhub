class StaticPagesController < ApplicationController
  def home
    @users = User.joins(:themes).where(themes: {name: params[:theme].strip}) if params[:theme].present?
  end

  def help
  end

  def about
  end

  def contact
  end
end
