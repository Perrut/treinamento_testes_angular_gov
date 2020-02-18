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
      end while easy_questions.size < 5
      
      medium_questions = []
      
      start_medium = Question.where(_level: 1).order(id: :asc).first.id
      end_medium = Question.where(_level: 1).order(id: :desc).first.id

      begin
        question = Question.find(rand(start_medium..end_medium))
        medium_questions.push(QuestionSerializer.new(question)) unless medium_questions.include?(question)
      end while medium_questions.size < 5
      
      hard_questions = []
      
      start_hard = Question.where(_level: 2).order(id: :asc).first.id
      end_hard = Question.where(_level: 2).order(id: :desc).first.id

      begin
        question = Question.find(rand(start_hard..end_hard))
        hard_questions.push(QuestionSerializer.new(question)) unless hard_questions.include?(question)
      end while hard_questions.size < 5
      
      questions = easy_questions + medium_questions + hard_questions
      
      start_very_hard = Question.where(_level: 3).order(id: :asc).first.id
      end_very_hard = Question.where(_level: 3).order(id: :desc).first.id
      
      question = Question.find(rand(start_very_hard..end_very_hard))
      
      questions << QuestionSerializer.new(question)
      
      render json: {game: GameSerializer.new(@game), questions: questions}, status: :created, location: @game
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
