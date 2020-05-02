class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy, :answer_question]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end
  
  # POST /questions/answer/:id/:answer_id
  def answer_question
    @answer = Answer.find(params[:answer_id])
    
    if @question.correct_answer == @answer
      render json: { correct: true, correct_answer_id: @question.correct_answer_id }
    else
      render json: { correct: false, correct_answer_id: @question.correct_answer_id }
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      { question: params[:question], level: params[:level], answers: get_questions_from_params }
    end

    def get_questions_from_params
      answers = []

      answers_from_request = params[:answers] || []

      if answers_from_request.length > 0
        answers_from_request.each do |answer|
          if answer[:id]
            answers << Answer.find_by(id: answer[:id])
          else
            answers << Answer.create(content: answer[:content])
          end
        end
      end

      return answers
    end
end
