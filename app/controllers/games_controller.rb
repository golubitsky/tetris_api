class Api::GamesController < ApplicationController

  def index
    @games = Game.high_scores
  end

  def create
  end

  private

  def game_params
    params.require(:game).permit(:name, :score, :lines, :start_level, :end_level, :time)
  end
end
