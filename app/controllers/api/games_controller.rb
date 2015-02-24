class Api::GamesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @games = Game.high_scores
    render 'api/games/index'
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      @games = Game.high_scores
      render 'api/games/index'
    else
      render json: { error: @game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:username, :score, :lines, :start_level, :end_level, :time)
  end
end
