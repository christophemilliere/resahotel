class BookingsController < ApplicationController

	skip_before_filter :verify_authenticity_token, only: [:create,:update, :destroy]


	 # pattern de la route : /users/:user_id/bookings/
  def create
		#récuperation d'un utilisateur
		@user = User.find_by_id(params[:id])

		# création de la reservation de la chambre pour l'utilisateur
		@booking = @user.booking.new

		#ajoute des attributes pour la réservation
		@booking.number_booking = params[:number_booking]
		@booking.date_start = params[:date_start]
		@booking.date_end = params[:date_end]
		@booking.user_id = params[:id]
		@booking.room_id = params[:room_id]

		# sauvegare de la reservation
		if @booking.save
			render json:{ status: 200}
		end

  end

	# pattern de la route : /users/:user_id/bookings/:id
	def show
		#affiche la reservation par rapport un utilisateur.
		@user = User.find_by_id(params[:id])
		#affiche les informations de la réservation et de la chambre
		@user_resa = @user.bookings

		# affiche l'utilisateur et sa réservation et les information de la chambre
		render json:{user:@user,reservation:@user_reservation, room: @user_resa.room }
  end

	# pattern de la route : /users/:user_id/bookings/:id
	# mise à jours d'une reservation pour un utilisateur.
	def update
		#récuperation d'un utilisateur
		@user = User.find_by_id(params[:id])

		# récuperation de la réservation de l'utilisateur
		@booking = @user.bookings

		# mise à jour des attribute de la réservation
		@booking.date_start = params[:date_start]
		@booking.date_end = params[:date_end]

		# liaison entre la reservation et l'utilisateur
		@booking.user_id = params[:id]

		# Id sur le type de chambre
		@booking.room_id = params[:room_id]

		# sauvegare de la reservation
		if @booking.save
			render json:{ status: 200}
		end
  end

	# pattern de la route : /users/:user_id/bookings/:id
	#supprime un réservation
	def destroy

		#recuperation de la reservation
		if @resa = Booking.find_by_id(params[:id])
			#supprime :a reservation
			@resa.destroy
			render json:{ success: 200, message:"Réservation supprimé"}
		else
			render json:{ error:404,message:"La reservation n'a pas été enregistré"}
		end
  end

end
