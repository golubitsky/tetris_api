class Api::GamesController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def index
    puts "index action"
    unless request.headers['origin'] == 'http://golubitsky.github.io'
      render json: { error: "Unapproved origin." }
      return
    end

    @games = Game.high_scores
    render 'api/games/index'
  end

  def create
    puts "create action"
    unless request.headers['origin'] == 'http://golubitsky.github.io'
      render json: { error: "Unapproved origin." }
      return
    end

    @game = Game.new(game_params)
    @game.username = @game.username.upcase

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
