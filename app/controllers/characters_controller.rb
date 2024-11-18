class CharactersController < ApplicationController
before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
  end

  def create
    @character = Character.new(character_params)
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
    
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :gender, :planet, :image_url, :price)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
