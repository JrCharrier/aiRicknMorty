class CharactersController < ApplicationController
before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @find_character = Character.global_search(params[:query])
    else
      @find_character = Character.all
    end
  end

  def show
    if current_user.owns?(@character)
    @character.bookings
    end
    @booking = Booking.new(character: @character)
    @all_bookings = Booking.pluck(:start_date, :end_date).map do |start_date, end_date|
      [start_date.to_s, end_date.to_s]
    end
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save
      redirect_to character_path(@character)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @character.update(character_params)
    redirect_to character_path(@character)
  end

  def destroy
    @character.destroy
    redirect_to characters_path, status: :see_other
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :gender, :planet, :image_url, :price)
  end

  def set_character
    @character = Character.find_by(id: params[:id])
    unless @character
      redirect_to characters_path, alert: "Character not found"
    end
  end
end



# dans la vue show
# mettre en valeur
