class UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token, only: [:create,:update, :destroy]


  def create
		@user = User.new
		@user.name = params[:name]
		@user.address = params[:address]

		if @user.save
			render json:{status: 200}
		else
			render json:{error: "error"}
		end

  end

	def update
		@user = User.find_by_id(params[:id])
		@user.update_attributes(name: params[:name], address: params[:address])
  end

	def show
		@user = User.find_by_id(params[:id])
		render json:{ user: @user}
  end
	
	def update
		@user = User.find_by_id(params[:id])
		@user.update_attributes(name: params[:name], address: params[:address])
  end

	def destroy
		@user = User.find_by_id(params[:id])
		@user.destroy
		render json:{ delete: " user delete"}
  end

end
