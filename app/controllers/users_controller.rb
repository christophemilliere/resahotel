class UsersController < ApplicationController

  def create
		@title = "create"

		render json:{test: params.inspect}
  end

	def update
		@title = "update"
  end

	def show
		@title = "show"
  end

	def delete
		@title = "delte"
  end


end
