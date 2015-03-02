class Api::GamesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  before_action :approved_origin?

  def index
    @games = Game.high_scores
    render 'api/games/index'
  end

  def create
    @game = Game.new(game_params)
    @game.username = @game.username.upcase
    @game.username = "ANONYMOUS" if @game.username == ''

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

  def approved_origin?
    if request.headers['origin'] != 'http://golubitsky.github.io'
      render json: { error: "Unapproved origin." }
    end
  end

end
