class PagesController < ApplicationController
  def home
    @title = "title"

    @user = User.all

    render json:{ user: @user.inspect}
  end
end
