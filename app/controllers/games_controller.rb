class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      easy_questions = []
      
      start_easy = Question.where(_level: 0).order(id: :asc).first.id
      end_easy = Question.where(_level: 0).order(id: :desc).first.id

      begin
        question = Question.find(rand(start_easy..end_easy))
        easy_questions.push(QuestionSerializer.new(question)) unless easy_questions.include?(question)
      end while easy_questions.size < 6
      
      
      render json: {game: @game, questions: easy_questions}, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:_player_name, :_score)
    end
end
