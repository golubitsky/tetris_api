class Api::GamesController < ApplicationController

  def index
    @games = Game.high_scores
    render 'api/games/index'
  end

  def create
    @game = current_user.photos.new(photo_params)

    if @game.save
      @games = Game.high_scores
      render json: @game
    else
      render json: { error: "There was an internal error." }, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :score, :lines, :start_level, :end_level, :time)
  end
end
